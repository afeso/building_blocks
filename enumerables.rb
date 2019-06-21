# frozen_string_literal: true

include Enumerable

# Creating own version of ruby enemerable methods
module Enumerable
  def my_each(els)
    els.length.times do |index|
      yield els[index]
    end
    els
  end

  def my_each_with_index(els)
    els.length.times do |index|
      yield(els[index], index)
    end
    els
  end

  def my_select(els)
    new_els = []
    my_each(els) do |val|
      new_els << val if yield(val) == true
    end
    new_els
  end

  def my_all?(els)
    result = nil
    my_each(els) do |val|
      result = yield(val)
      return false if result == false
    end
    # return true of tht above conditional didn't run
    true
  end

  def my_any?(els)
    my_each(els) do |val|
      result = yield(val)
      return true if result
    end
    false
  end

  def my_none?(els)
    my_each(els) do |val|
      result = yield(val) # yield returns a boolean
      return false if result
    end
    true
  end

  def my_count(els)
    counter = 0
    my_each(els) { counter += 1 }
    counter
  end

  def my_map(els)
    new_els = []
    my_each(els) do |val|
      new_els << yield(val)
    end
    new_els
  end

  def my_inject(els, proc = nil, return_val = nil)
    els = my_map(els) { |val| val }
    return_val = els.shift if return_val.nil?
    if block_given?
      my_each(els) { |val| return_val = yield(return_val, val) }
    else
      my_each(els) { |val| return_val = proc.call(return_val, val) }
    end
    return_val
  end
end

# tester = %w[this is a pen]
# tester2 = ['this', 'is', 'a', 'pen', 1, 2, 3, {}]
# tester3 = [1, 2, 3, 4, 5]

# puts "Each value in #{tester} capitalized is:"
# my_each(tester) { |val| puts val.upcase }
# puts

# puts "In #{tester} the "
# my_each_with_index(tester) { |val, index| puts "Index of #{val} is #{index}." }
# puts

# puts "SELECT values from #{tester2} which are only Integers"
# selected = my_select(tester2) { |val| val.is_a? Integer }
# p selected
# puts

# puts "ALL values in #{tester} is a String?"
# all_test = my_all?(tester) { |val| val.is_a? String }
# p all_test
# puts

# puts "Is ANY value in #{tester2} a Hash?"
# any_test = my_any?(tester2) { |val| val.is_a? Hash }
# p any_test
# puts

# puts "NONE of the values in #{tester2} is an Array?"
# none_test = my_none?(tester2) { |val| val.is_a? Array }
# p none_test
# puts

# puts "COUNTing the elements in #{tester2}, the result is:"
# p my_count(tester2)
# puts

# puts "MAPping Values in #{tester2}, if value is an Integer. Value Squared is:"
# map_test = my_map(tester2) { |val| val**2 if val.is_a? Integer }
# p map_test
# puts

# puts "Using INJECT to Add all the elements in #{tester3}, result is: "
# inject_test = my_inject(tester3, 0) { |a, b| a + b }
# puts inject_test
# puts
# puts "And Multiplying all the elements in #{tester3} gives: "
# def multiply_els(elements)
#   my_inject(elements) { |a, b| a * b }
# end

# p multiply_els(tester3)
# # puts
# puts "Multiplying #{tester3} using a proc is:"
# multiply_elements = proc { |a, b| a * b }
# p my_inject(tester3, multiply_elements, 1)
# p tester3.inject(&multiply_elements)

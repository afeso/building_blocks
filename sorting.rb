# frozen_string_literal: true

# function for switching values in an array
def switch_value(arr, val1, val2, index)
  unless index.nil?
    arr[index] = val2
    arr[index + 1] = val1
  end
end

def bubble_sort(obj)
  return "#{obj.upcase} is not an enumerable object" unless obj.is_a?(Array)

  run = obj.length - 1

  run.times do
    obj.length.times do |index|
      val1 = obj[index]
      val2 = obj[index + 1]

      unless val2.nil?
        switch_value(obj, val1, val2, index) if val1 > val2
      end
    end
  end
  obj
end

def bubble_sort_by(array)
  first = second = nil
  run = array.length - 1

  run.times do
    array.length.times do |index|
      first = array[index]
      second = array[index + 1]
      comparison_result = yield(first, second) unless second.nil?

      unless comparison_result.nil?
        switch_value(array, first, second, index) if comparison_result.positive?
      end
    end
  end
  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort([98, 88, 78, 68, 48, 38, 28, 18, 8])
p bubble_sort(%w[this is a pencil])
p bubble_sort('The Quick Black Fox')

puts 'starting bubble sort by:'
puts ''

my_sort = bubble_sort_by(%w[hi hello hey]) do |left, right|
  left.length - right.length
end

p my_sort

p bubble_sort_by(%w[this is a pen]) { |a, b| b <=> a }

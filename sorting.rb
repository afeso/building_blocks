numbers = [4, 3, 78, 2, 0, 2]

def bubble_sort(elements)
  return "'#{elements}' is not an enumerable object" unless elements.is_a?(Array)

  run = elements.length - 1

  run.times do
    # value1 = elements[index]
    # value2 = elements[index + 1]
    elements.length.times do |index|
      value1 = elements[index]
      value2 = elements[index + 1]

      if !value2.nil? && value1 <= value2
        next
      else
        # elements[index] = value2 unless value2.nil?
        # elements[index] = value2
        # elements[index + 1] = value1
        switch_value(elements, value1, value2, index)
      end
    end
  end
  elements.compact
end

def switch_value(elements, val1, val2, index)
  elements[index] = val2
  elements[index + 1] = val1
  # elements
end

p bubble_sort(numbers)
p bubble_sort([98, 88, 78, 68, 48, 38, 28, 18, 8])
p bubble_sort(%w[this is a pencil])
p bubble_sort('The Quick Black Fox')

puts 'starting bubble sort by:'
puts ''

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

my_sort = bubble_sort_by(%w[hi hello hey]) do |left, right|
  left.length - right.length
end

p my_sort

ruby_sort = %w[hi hey hello].sort do |left, right|
  left.length - right.length
end

p ruby_sort

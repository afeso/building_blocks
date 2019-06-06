numbers = [4, 3, 78, 2, 0, 2]

def bubble_sort(elements)
  return "#{elements} is not an enumerable object" unless elements.is_a?(Array)

  run_time = elements.length - 1

  run_time.times do
    # value1 = elements[index]
    # value2 = elements[index + 1]
    elements.length.times do |index|
      value1 = elements[index]
      value2 = elements[index + 1]

      if !value2.nil? && value1 < value2 || value1 == value2
        next
      else
        # elements[index] = value2 unless value2.nil?
        # elements[index] = value2
        # elements[index + 1] = value1
        switch_value(elements, value1, value2, index)
      end
    end
  end
  elements.select { |val| val unless val == nil? }
end

def switch_value(elements, val1, val2, index)
  elements[index] = val2
  elements[index + 1] = val1
  # elements
end

p bubble_sort(numbers)
p bubble_sort([98, 88, 78, 68, 48, 38, 28, 18, 8])
p bubble_sort(['this', 'is', 'a', 'pencil'])
p bubble_sort('The Quick Black Fox')

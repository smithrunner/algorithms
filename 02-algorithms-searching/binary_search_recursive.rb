def binary_search_recursive(array, value)
  low = 0
  high = array.length - 1
  mid = (low + high) / 2
  
  if low >= high
    return false
  end
  
  if array[mid] == value
    return mid
  elsif array[mid] > value
    binary_search_recursive(array[0..mid],value)
  elsif array[mid] < value
    binary_search_recursive(array[mid..high],value)
  end
end

test_array = [1,2,3,4,5,6,7,8,9]

puts binary_search_recursive(test_array,8)

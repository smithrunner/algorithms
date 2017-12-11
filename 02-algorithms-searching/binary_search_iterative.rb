def binary_search_iterative(array, value)
  low = 0
  high = array.length - 1
  while low <= high
	  mid = (low + high) / 2
	  if array[mid] > value
		  high = mid - 1
		elsif array[mid] < value
		  low = mid + 1
		else
		  return mid
		end
	end
	
	return "not found"
end

test_array = [1,2,3,4,5,6,7,8,9]

puts binary_search_iterative(test_array,3)
puts binary_search_iterative(test_array,10)
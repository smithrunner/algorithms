# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = arrays.reduce([], :concat)
  
  sorted_array = [combined_array[0]]
  combined_array.delete_at(0)

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

# Return the sorted array
  sorted_array
end

sorted = poorly_written_ruby([3,2],[1,4],[6,5])

puts sorted
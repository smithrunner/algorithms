# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = combined_array = arrays.reduce([], :concat)
  
  n = combined_array.length
  loop do
    swapped = false
    
    (n-1).times do |i|
      if combined_array[i] > combined_array[i+1]
        combined_array[i], combined_array[i+1] = combined_array[i+1], combined_array[i]
        swapped = true
      end
    end
    
    break if not swapped
  end
  
  combined_array
end

sorted = poorly_written_ruby([3,2],[1,4],[6,5])

puts sorted
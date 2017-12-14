# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_array = combined_array = arrays.reduce([], :concat)
  
  def quick_sort(array)
    if array.empty?
      return []
    else
      pivot = array.last
      right_side = []
      left_side = []
    
      array.each do |val|
        if val > pivot
          right_side << val
        elsif val < pivot
          left_side << val
        end
      end
    
      return quick_sort(left_side) << pivot << quick_sort(right_side)
    end
  end

  return quick_sort(combined_array)
end

sorted = poorly_written_ruby([3,2],[1,4],[6,5])

puts sorted
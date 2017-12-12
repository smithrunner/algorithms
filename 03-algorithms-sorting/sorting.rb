require 'benchmark'
##########################################################
## Quick Sort Method #####################################
##########################################################
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

##########################################################
## Heap Sort Method ######################################
##########################################################
def heapsort(array)
  n = array.size
  a = [nil] + array
  (n / 2).downto(1) do |i|
    down_heap(a,i,n)
  end
  while n > 1
    a[1], a[n] = a[n], a[1]
    n-=1
    down_heap(a,1,n)
  end
  a.drop(1)
end

def down_heap(a,parent,limit)
  wk = a[parent]
  while (child = 2 * parent) <= limit
    child += 1 if child < limit and a[child] < a[child+1]
    break if wk >= a[child]
    a[parent] = a[child]
    parent = child
  end
  a[parent] = wk
end

##########################################################
## Bucket Sort Method ####################################
##########################################################
def bucket_sort(array,n,max)
  buckets = []
  n.times do
    buckets << []
  end
  array.each do |val|
    bucket = val * n / (max+1)
    buckets[bucket] << val
  end
  sorted = []
  buckets.each do |bucket|
    sorted << quick_sort(bucket)
  end
  return sorted
end

##########################################################
## Testing ###############################################
##########################################################
array = Array.new(50) { Random.rand(1..50) }

Benchmark.bm do |x|
  x.report("Quick Sort:              ") {quick_sort(array)}
  x.report("Heap Sort:               ") {heapsort(array)}
  x.report("Bucket Sort(3 buckets):  ") {bucket_sort(array,3,50)}
  x.report("Bucket Sort(5 buckets):  ") {bucket_sort(array,5,50)}
  x.report("Bucket Sort(10 buckets): ") {bucket_sort(array,10,50)}
  x.report("Bucket Sort(30 buckets): ") {bucket_sort(array,30,50)}
end

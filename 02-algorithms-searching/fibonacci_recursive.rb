require 'benchmark'

def recus_fib(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return recus_fib(n-1) + recus_fib(n-2)
  end
end

def fib(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    grandpar = 0
    par = 1
    index = 2
    fib = grandpar + par
    while index != n
      grandpar = par
      par = fib
      fib = grandpar + par
      index += 1
    end
    return fib
  end
end

Benchmark.bm do |x|
  x.report("Recursive: ") { recus_fib(20) }
  x.report("Iterative: ") { fib(20) }
end
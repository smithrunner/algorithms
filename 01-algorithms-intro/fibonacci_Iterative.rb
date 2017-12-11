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

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)

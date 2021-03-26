def fib(n)
  n.times.each_with_object([0,1]) { |n, obj| obj << obj[-2] + obj[-1] }
end
puts fib 10

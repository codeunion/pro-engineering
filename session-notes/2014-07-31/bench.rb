
# This method takes a label and a block as input and
# returns the amount of time it took for the block to
# execute (in seconds).

def bench(&block)
  t0 = Time.now
  block.call
  t1 = Time.now

  t1 - t0
end

def fib(n)
  a, b = 0,1

  n.times do
    a, b = b, a + b
  end

  a
end

# Let's benchmark some Fibonacci numbers!
(0..18).each do |i|
  print "fib(2**#{i}) took... "

  time = bench { fib(2**i) }

  puts "#{time}s"
end

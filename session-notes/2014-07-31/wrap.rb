def wrap_with(before, after = nil, &block)
  puts before

  block.call("hello")

  puts after ? after : before
end

wrap_with("Bubbles!") do |arg|
  puts "We were passed: #{arg.inspect}"
end

puts ""

wrap_with("<p>", "</p>") do |arg|
  puts "What was the arg? It was: #{arg.inspect}"
end

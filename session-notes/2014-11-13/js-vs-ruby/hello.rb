def max(x,y)
  if x < y
    y
  else
    x
  end
end

puts max(5,4) == 5
puts max(0, 10) == 10


# [3,4].max   - calls max
# [3,4].max() - calls max


numbers.each do |number|
  puts number
end

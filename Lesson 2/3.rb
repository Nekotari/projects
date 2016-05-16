arr = [0, 1]
loop do
	new = arr[-1]+arr[-2]
	break if new > 100
	arr << new
end
puts arr
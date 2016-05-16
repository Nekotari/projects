arr = [0, 1]
loop do
	new = arr[-1]+arr[-2]
if new < 100
	arr << new
else
	break
end
end
puts arr
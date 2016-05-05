puts "Введите коэффициенты"
puts "a:"
a = gets.to_f
puts "b:"
b = gets.to_f
puts "c:"
c = gets.to_f

#а * (х**2) + b*x + c = 0
d = b**2 - 4*a*c

if d>0
	f = (-b + Math.sqrt(d))/(2*a)
	s = (-b - Math.sqrt(d))/(2*a)
	puts "D=#{d}   x1=#{f}   x2=#{s}"
elsif d==0
	x= -b/(2*a)
	puts "D=#{d}   x1=x2=#{x}"
else
	puts "Корней нет!"
end
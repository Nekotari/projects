puts "Введите длину 1 стороны треугольника:"
first = gets.to_f
puts "Введите длину 2 стороны треугольника:"
second = gets.to_f
puts "Введите длину 3 стороны треугольника:"
third = gets.to_f

if first.eql?(second) && first.eql?(third)
	puts "треугольник равносторонний и прямогульным не является"
	exit
elsif first.eql?(second) or second.eql?(third) or first.eql?(third)
	puts "треугольник равнобедренный"
end
pos="треугольник прямоугольный"
neg="треугольник не является прямоугольным"
if first>second && first>third
	if (second**2) + (third**2) == (first**2)
		puts pos
	else
		puts neg
	end
elsif second>first && second>third
	if (first**2) + (third**2) == (second**2)
		puts pos
	else
		puts neg
	end
elsif third>first && third>second
	if (second**2) + (first**2) == (third**2)
		puts pos
	else
		puts neg
	end
end
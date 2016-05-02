print "Введите имя:"
name = gets.chomp
print "{name}, dведите рост:"
height = gets.to_i
ideal_w = height - 110
puts "Результат: #{ideal_w}"
if ideal_w < 0
	puts "#{name}, ваш вес оптимален!"
end
	
	
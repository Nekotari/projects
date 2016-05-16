hash={}
loop do
	puts "Введите название товара:"
	name = gets.chomp
		if name == "стоп"
			break
		end
	puts "Введите цену:"
	price = gets.to_f
	puts "Введите количество:"
	q =gets.to_f
hash[name]={price => q}
end
puts hash
sum=0
hash.each do |key, value|
	print "#{key}: "
	value.each do |k, v|
		total=k*v
		sum = sum+total
	puts "#{total}"
	end

end
puts "Итого: #{sum}"
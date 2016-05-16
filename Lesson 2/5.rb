months = [
31,
28,
31,
30,
31,
30,
31,
31,
30,
31,
30,
31]
puts "Введите год:"
year = gets.to_f
puts "Введите месяц:"
m = gets.to_i
m=m-1
puts "Введите день:"
day = gets.to_i

if year % 4==0
	months[1]=29
end
if year % 100 ==0
	months[1]=28
end
if year % 400==0
	months[1]=29
end
sum=0
m.times do |i|
	sum = sum + months[i]
end
sum=sum+day
puts "Это #{sum}день года"
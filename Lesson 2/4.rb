letters = {}
("a".."z").each_with_index do |l, i|
	letters[l]=i+1 if l=="a" || l=="e" || l=="o" || l=="i" || l=="u" || l=="y"
end
puts letters
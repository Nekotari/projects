letters = {}
voc = ["a","e","o","i","u","y"]
("a".."z").each_with_index do |l, i|
	letters[l]=i+1 if voc.include?(l)
end
puts letters
require_relative "station"
require_relative "route"
require_relative "train"
require_relative "cargo_car"
require_relative "cargo_train"
require_relative "passenger_car"
require_relative "passenger_train"

train1=CargoTrain.new("aaa11", 2)
train2=PassengerTrain.new("bbb22", 2)
station1=Station.new("samara")
car1=CargoCar.new(10)
car2=CargoCar.new(20)
car3=PassengerCar.new(50)
train1.long(car1)
train1.long(car2)
train2.long(car3)
station1.income_train(train1)
station1.income_train(train2)
station1.station_block do |i|
 puts "#{i.num} #{i.type} #{i.length}"
 count=0
 i.train_block { |i| count+=1; puts "#{count} #{i.car_type} #{i.free}/#{i.hold}"}
end

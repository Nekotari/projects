class PassengerTrain < Train
  def initialize(num, length)
    super
    @type="passenger"
  end
  
  def long(car)
    if car.car_type == "passenger"
      super
    else
      puts "Cargo car can't be added to a passenger train."
    end
  end
end
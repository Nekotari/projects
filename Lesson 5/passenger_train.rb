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
  
  def short(car_type)
    if car.car_type == "passenger"
      super
    else
      puts "No cargo cars on a passenger train."
    end
  end
end
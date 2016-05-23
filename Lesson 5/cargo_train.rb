class CargoTrain < Train
  def initialize(num, length)
    super
    @type="cargo"
  end

  def long(car)
    if car.car_type == "cargo"
      super
    else
      puts "Passenger car can't be added to a cargo train."
    end
  end
  
  def short(car)
    if car.car_type == "cargo"
      super
    else
      puts "No passenger cars on a cargo train."
    end
  end
end
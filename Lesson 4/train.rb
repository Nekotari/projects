class Train
  attr_reader :speed, :length, :num, :type
  
  def initialize(num, length)
  	@num=num
  	@length=length
    @speed =0
    @cars=[]
  end

  def plus_speed(v)
  	self.speed += v 
  end

  def show_speed
    puts "Current speed is #{self.speed}"
  end

  def stop
    self.speed =0
  end

  def how_long
    puts "There are #{self.length} cars. #{@cars}"
  end

  def long(car)
    if self.speed==0
      self.length +=1
      @cars << car
    else
      puts "The train is moving. Stop it first."
    end
  end
  
  def short(car)
    if self.speed==0
      self.length -=1
      cars.delete(car)
    else
      puts "The train is moving. Stop it first."
    end
  end

  def set_route(route)
    @route=route
    @st= 0
    @current=@route.list[@st]
  end

  def move(where)
    if where=="forw"
      @st +=1
      @current=@route.list[@st]
    elsif where=="back"
      @st -=1
      @current=@route.list[@st]
    else puts "Error!"
    end
  end

  def show(the)
    if the=="current"
      puts "Current station is #{@current}"
    elsif the=="prev"
      puts "Previous station is #{@route.list[@st-1]}" if @st>0
    elsif the=="next"
      puts "Next station is #{@route.list[@st+1]}"
    else puts "Error!"
    end
  end

protected
attr_writer :speed, :length, :num, :type
end

class PassengerCar
  attr_reader :car_type
  def initialize
   @car_type="passenger"
  end
end

class CargoCar
  attr_reader :car_type
  def initialize
   @car_type="cargo"
  end
end

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
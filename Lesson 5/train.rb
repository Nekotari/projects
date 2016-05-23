require_relative "module"
class Train
  attr_accessor :speed, :length, :num, :type
  include Produced
  @@trains={}
  def initialize(num, length)
  	@num=num
  	@length=length
    @speed =0
    @cars=[]
    @@trains[num]=self.itself
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
      @cars.delete(car)
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
  
  def self.find(num)
    if @@trains.has_key?(num)
      @@trains.each do |key, value|
        puts value if key == num
      end
    else
      puts nil
    end
  end
end

a=Train.new(7, 2)
b=Train.new(5, 3)
Train.find(7)
Train.find(7)
Train.find(5)
Train.find(3)
Train.find(5)

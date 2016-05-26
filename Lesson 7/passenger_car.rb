
require_relative "module"

class PassengerCar
  attr_accessor :car_type, :places, :free, :hold
  include Produced

  def initialize(places)
   @car_type="passenger"
   @places=places
   @free=places
   @hold=0
  end

  def add
    @hold+=1
    @free-=@hold
  end
end
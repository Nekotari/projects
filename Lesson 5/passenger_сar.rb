
require_relative "module"
class PassengerCar
  attr_accessor :car_type
  include Produced
  def initialize
   @car_type="passenger"
  end
end
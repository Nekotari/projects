require_relative 'module'
class CargoCar
  attr_accessor :car_type, :volume, :free, :hold
  include Produced

  def initialize(volume)
    @car_type = 'cargo'
    @volume = volume
    @free = volume
    @hold = 0
  end

  def add(x)
    @hold += x
    @free -= @hold
  end
end

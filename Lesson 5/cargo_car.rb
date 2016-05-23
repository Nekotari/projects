require_relative "module"
class CargoCar
  attr_accessor :car_type
  include Produced
  def initialize
   @car_type="cargo"
  end
end
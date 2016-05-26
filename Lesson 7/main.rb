require_relative "station"
require_relative "route"
require_relative "train"
require_relative "cargo_car"
require_relative "cargo_train"
require_relative "passenger_car"
require_relative "passenger_train"

class Main
	attr_accessor :stations, :stations_list
  def initialize
  	@stations_list=[]
    @stations=[]
  end

  def create_station(station)
    @station = Station.new(station)
    @stations << @station
    @stations_list << @station.name
  end

  def create_train
    puts "Enter train number & length"
    arr= gets.chomp.split
    @id = CargoTrain.new(arr[0], arr[1])
    puts "Train number #{arr[0]} with #{arr[1]} cars created!"
  rescue
    puts "wrong data"
    retry
  end

  def add_car(carid, id)
  	@carid=CargoCar.new
    @id.long(@carid)
  end

  def remove_car(carid, id)
    @id.short(@carid)
  end

  def train_station(id, station)
    @station.income_train(@id)
  end

  def show_stations
  	puts @stations_list
  end

  def show_trains(station)
    @station.list
  end
end

a=Main.new


loop do
  puts "Choose an action:"
  case gets.chomp

  when "create_station"
    puts "Enter station name:"
    station=gets.chomp
    a.create_station(station)

  when "create_train"
    a.create_train

  when "add_car"
    puts "Enter car & train number"
    arr= gets.chomp.split
    a.add_car(arr[0], arr[1])

  when "remove_car"
    puts "Enter car & train number"
    arr= gets.chomp.split
    a.remove_car(arr[0], arr[1])

  when "train_station"
    puts "Enter train number & station name"
    arr= gets.chomp.split
    a.train_station(arr[0], arr[1])

  when "show_stations"
    a.show_stations

  when "show_trains"
    puts "Enter station name:"
    station=gets.chomp
    a.show_trains(station)

  when "exit"
  	break
  end

end
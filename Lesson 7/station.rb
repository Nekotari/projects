class Station
  attr_accessor :name
  NAME = /\w+/
  @@stations = []

  def initialize(name)
    @name = name.to_s
    validate!
    @train_list = {}
    @trains = []
    @@stations << @name
  end

  def valid?
    validate!
  rescue
    false
  end

  def station_block
    @trains.each do |train|
      yield(train)
    end
  end

  def income_train(train)
    @train_list[train.num] = train.type
    @trains << train
  end

  def list
    puts @train_list.keys
  end

  def type_list(type)
    @train_list.each do |key, value|
      puts key if type == value
    end
  end

  def send_train(train)
    @train_list.delete(train.num)
  end

  def self.all
    puts @@stations
  end

  protected

  def validate!
    raise 'Invalid name format!' if name !~ NAME
    true
  end
end

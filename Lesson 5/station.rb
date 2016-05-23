class Station

  attr_accessor :name
  
  @@stations=[]
  def initialize(name)
  	@name=name
  	@train_list={}
    @@stations<<@name
  end

  def income_train(train)
    @train=train
    @train_list[train.num] = train.type
  end

  def list
    puts @train_list.keys
  end

  def type_list(type)
    @train_list.each do |key, value|
      if type == value
        puts key
      end
    end
  end

  def send_train(train)
    @train_list.delete(train.num)
  end

  def self.all
    puts @@stations
  end
end

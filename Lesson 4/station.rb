class Station
  attr_reader :name
  def initialize(name)
  	@name=name
  	@train_list={}
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
end
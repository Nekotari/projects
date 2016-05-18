class Station
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

class Route
  def initialize(first, last)
    @st_list=[first, last]
  end
  def list
    @st_list
  end
  def st_list
    puts @st_list
  end
  def add_st(name)
    @st_list.insert(-2, name)
  end
  def del_st(name)
    @st_list.delete(name)
  end
end

class Train
  attr_accessor :speed, :length, :num, :type
  def initialize(num, type, length)
  	@num=num
  	@type=type
  	@length=length
    @speed =0
  end

  def plus_speed(v)
  	self.speed += v 
  end

  def speed
    puts "Current speed is #{self.speed}"
  end

  def stop
    self.speed =0
  end

  def length
    puts "There are #{self.length} cars."
  end

  def change_length(ch)
    if self.speed==0
      if ch=="+"
        self.length +=1
      elsif ch=="-"
        self.length -=1
      else puts "Error!"
      end
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
end


class Route
  NAME = /\w+/
  
  def initialize(first, last)
    @first=first
    @last=last
    @st_list=[first, last]
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

protected
  def validate!
    raise "Invalid station name format!" if @first !~ NAME or @last !~ NAME
  true
  end
end

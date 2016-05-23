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
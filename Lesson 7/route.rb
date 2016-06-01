class Route
  attr_accessor :first, :last
  NAME = /\w+/
require_relative 'lesson9'
  extend Validation::ClassMethods
  include Validation::InstanceMethods
  validate name: :first, validation: :presence
validate name: :first, validation: :format, regexp: NAME
validate name: :last, validation: :presence
validate name: :last, validation: :format, regexp: NAME
  def initialize(first, last)
    @first = first
    @last = last
    @st_list = [first, last]
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

  #def valid?
  #  validate!
  #rescue
  #  false
  #end

  #protected

  #def validate!
  #  raise 'Invalid station name format!' if @first !~ NAME || @last !~ NAME
  #  true
  #end
end
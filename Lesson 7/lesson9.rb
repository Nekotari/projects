module Accessor
  def attr_accessor_with_history(*names)
    names.each do |name|
      var="@#{name}".to_sym
      mem="@#{name}_history".to_sym

      define_method("#{name}_history".to_sym) do
      	instance_variable_get(mem)
      end

      define_method(name) do
      	instance_variable_get(var)
      end

      define_method("#{name}=".to_sym) do |v|
      	instance_variable_set(var, v)
      	instance_variable_set(mem, []) if instance_variable_get(mem).nil?
      	instance_variable_get(mem).send :<<, v
      end
     
    end
  end

  def strong_attr_accessor(*names, cl)
  	names.each do |name|
      var="@#{name}".to_sym
      cl="#{cl.strip}"
      
      define_method(name) do
      	instance_variable_get(var)
      end

      define_method("#{name}=".to_sym) do |v|
      	instance_variable_set(var, v) if v.class.to_s == cl
      	raise "Wrong class" if v.class.to_s != cl
      end
    end
  end
end

module Validation

 module ClassMethods
attr_accessor :valid_arr
  def validate(par={})
    @valid_arr ||= []
    @valid_arr<<par
  end
 end

 module InstanceMethods

  def validate!
    self.class.valid_arr.each do |hash|
  	  self.send "validate_#{hash[:validation]}", hash
    end
  	true
  end

  def valid?
  	validate!
  rescue
  	false
  end

protected
  def validate_presence(hash)
    raise "NIL!" if self.send("#{hash[:name]}") == ""
  end

  def validate_format (hash)
    raise 'Invalid format!' if self.send("#{hash[:name]}") !~ hash[:regexp]
  end

  def validate_type (hash)
    raise 'Wrong class' if self.send("#{hash[:name]}").class.to_s != hash[:typeof].to_s
  end

 end

 end
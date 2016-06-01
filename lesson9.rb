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
  def validate(name, v_type, *par)
    case v_type
    when :presence 
    	mistake= "NIL!" if name==" "
    when :format 
    	mistake= 'Invalid format!' if name !~ par
    when :type 
    	mistake='Wrong class' if name.class.to_s != par.strip.to_s
    end
  end
 end

 module InstanceMethods

  def validate!
  	self.validate
  	raise mistake if !mistake.nil?
  	true
  end

  def valid?
  	validate!
  rescue
  	false
  end
 end

 end
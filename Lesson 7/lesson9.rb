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
  $validations=[]
  def validate(*par)
    $validations<<par[1]
    define_method(par[1].to_sym) do
case par[1]
when :presence 
      raise "NIL!" if par[0]==" "
    when :format 
      raise 'Invalid format!' if par[0] !~ par[2]
    when :type 
      raise 'Wrong class' if par[0].class.to_s != par[2].strip.to_s
    end
    end

    
  end
 end



 module InstanceMethods

def validate!
$validations.each do |x|
self.send x
end
true


    end
  #def validate!
  
  #	true
  #end

  def valid?
  	validate!
  rescue
  	false
  end
 end

 end
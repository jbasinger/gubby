
class Object

  def unextend(mod)
		
		metaclass = class << self; self end
		mod.instance_methods.each {|method_name| metaclass.class_eval { undef_method(method_name.to_sym) }}
		
  end
	
end
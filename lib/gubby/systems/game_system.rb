
module Gubby
	
	module Systems
		
		class GameSystem
			
			attr_reader :entities
			
			def initialize(*args)
				
				@entities = []
				@component_types = args
				
			end

			def refresh_entity(e)
				
				#We need to make sure the entity is all the types it needs to be
				is_compatible = true
				
				@component_types.each do |c|
					is_compatible = is_compatible && e.is_a?(c)
				end
				
				if is_compatible && !@entities.include?(e) 
					@entities.push(e)
				end
				
				if not is_compatible && @entities.include?(e)
					@entities.delete(e)
				end
				
			end
				
		end
		
	end
	
end
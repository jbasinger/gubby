
module Gubby
	class GameEntity
		
		attr_accessor	:entity_name,
									:engine
		
		attr_reader :components
		
		def initialize(name = nil, *components)
			
			@components = []
			@entity_name = name unless name.nil?
			add_component(*components)
			
		end
		
		def add_component(*components)
			
			components.each do |c|
				extend(c)
				@components.push(c)
				if self.respond_to?(:component_added) then
					self.component_added
				end
			end
			
			@engine.refresh_entity(self) unless @engine.nil?
			
		end
		
		def remove_component(*components)
			
			components.each do |c|
				unextend(c)
				@components.delete(c)
				if self.respond_to?(:component_removed) then
					self.component_removed
				end
			end

			@engine.refresh_entity(self) unless @engine.nil?

		end
		
		def destroy()
			@engine.remove_entity(self)
		end
		
	end
end
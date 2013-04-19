
module Gubby
	class GameEngine
		
		attr_accessor :systems
		attr_reader :entities
		
		def initialize(*systems)
			@systems = []
			@entities = []
			
			systems.each do |s|
				
				@systems.push(s)
				
			end
			
		end
		
		def run(command, *args)
			
			@systems.select{ |s| s.respond_to?(command) }.each do |s|
				s.send(command.to_s, *args)
			end
			
		end
			
		def add_entity(e)
			@entities.push(e) unless @entities.include?(e)
			e.engine = self
			@systems.each do |s|
				s.refresh_entity(e)
			end
		end
		
		def refresh_entity(e)
			@systems.each do |s|
				s.refresh_entity(e)
			end
		end
		
		def remove_entity(e)
			@entities.delete(e)
			@systems.each do |s|
				if s.entities.include?(e) then
					s.entities.delete(e)
				end
			end
			e.engine = nil
		end
		
		def [](*selectors)
			
			found = []
			
			selectors.each do |s|
				
				found.concat(@entities.select{|e| e.name == s}) if s.is_a?(String)
				found.concat(@entities.select{|e| e.is_a?(s)}) if s.is_a?(Module)
				
			end
			
			return found
			
		end
		
	end
end

module Gubby
	
	module Components
	
		module Position2D

			attr_accessor :x, :y, :z, :angle, :center_x, :center_y, :factor_x, :factor_y
			
			def Position2D.extend_object(e)
				super(e)
				e.x = 0
				e.y = 0
				e.z = 1
				e.angle = 0
				e.center_x = 0.5
				e.center_y = 0.5
				e.factor_x = 1
				e.factor_y = 1
			end
			
		end
	
	end
	
end
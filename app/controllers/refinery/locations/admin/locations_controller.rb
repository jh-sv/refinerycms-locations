module Refinery
	module Locations
		module Admin
			class LocationsController < ::Refinery::AdminController

			  crudify :'refinery/locations/location'
		  end
		end
	end		
end



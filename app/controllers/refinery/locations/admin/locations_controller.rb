module Refinery
	module Locations
		module Admin
			class LocationsController < ::Refinery::AdminController

			  crudify :'refinery/locations/location',
			          :title_attribute => 'name'

		  end
		end
	end		
end



module Refinery
	module Locations
		module Admin
			class LocationsController < ::Refinery::AdminController

			  crudify :'refinery/locations/location',
			          :title_attribute => 'title'

		  end
		end
	end		
end



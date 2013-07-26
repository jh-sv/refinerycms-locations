module Refinery
	module Locations
		module Admin
			class ImportsController < ::Refinery::AdminController

			  crudify :'refinery/locations/import',
			          :title_attribute => 'filename'

		  end
		end
	end		
end



module Refinery
	module Locations
		module Admin
			class ImportsController < ::Refinery::AdminController
			  crudify :'refinery/locations/import'
		  end
		end
	end		
end



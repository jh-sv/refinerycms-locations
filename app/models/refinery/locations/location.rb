module Refinery
	module Locations
		class Location < ActiveRecord::Base
		  acts_as_indexed :fields => [:name, :address, :phone, :hours, :longitude, :latitude]
		   self.table_name = 'refinery_locations'
		   validates_presence_of :name
		  validates_uniqueness_of :name
		end
	end
end

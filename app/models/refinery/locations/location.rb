require 'geocoder'
module Refinery
	module Locations
		class Location < ActiveRecord::Base
		  acts_as_indexed :fields => [:name, :address, :phone, :hours, :longitude, :latitude]
		  self.table_name = 'refinery_locations'
		  validates_presence_of :name
			attr_accessible :name, :address, :city, :state_or_province, :zip, :country, 
			 								:website, :phone, :hours, :longitude, :latitude, :online, :position,
			 								:women, :handbags, :shoes, :eyewear, :jewelry, :textile

			geocoded_by :full_street_address
			after_validation :geocode 

			# Aggregate attribute
			def full_street_address
				"#{self.address}, #{self.city}, #{self.state_or_province} #{self.zip}"
			end
		end
	end
end

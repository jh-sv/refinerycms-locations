class Location < ActiveRecord::Base
  acts_as_indexed :fields => [:name, :address, :phone, :hours, :longitude, :latitude]
  validates_presence_of :name
  validates_uniqueness_of :name
end

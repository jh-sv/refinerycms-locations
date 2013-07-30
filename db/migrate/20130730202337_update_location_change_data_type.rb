class UpdateLocationChangeDataType < ActiveRecord::Migration
  def up
  	remove_column(:refinery_locations, :latitude)
  	remove_column(:refinery_locations, :longitude)
  	add_column(:refinery_locations, :latitude, :float, :default => nil)
  	add_column(:refinery_locations, :longitude, :float, :default => nil)
  end

  def down
  	remove_column(:refinery_locations, :latitude)
  	remove_column(:refinery_locations, :longitude)
  	add_column(:refinery_locations, :latitude, :string, :default => nil)
  	add_column(:refinery_locations, :longitude, :string, :default => nil)
  end
end

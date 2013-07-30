class UpdateLocationChangeDataType < ActiveRecord::Migration
  def up
  	change_column(:refinery_locations, :latitude, :float)
  	change_column(:refinery_locations, :longitude, :float)
  end

  def down
  	change_column(:refinery_locations, :latitude, :string)
  	change_column(:refinery_locations, :longitude, :string)
  end
end

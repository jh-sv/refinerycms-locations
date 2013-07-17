class CreateLocations < ActiveRecord::Migration

  def self.up
    create_table :refinery_locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :hours
      t.string :longitude
      t.string :latitude
      t.integer :position

      t.timestamps
    end

    add_index :locations, :id

    load(Rails.root.join('db', 'seeds', 'locations.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Locations"})

    Page.delete_all({:link_url => "/locations"})

    drop_table :refinery_locations
  end

end

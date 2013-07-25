module Refinery
  module Locations
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Locations

      initializer "register refinery_locations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_locations"
          plugin.url = proc {  Refinery::Core::Engine.routes.url_helpers.locations_admin_location_path }
          plugin.activity = { :class_name => :'refinery/locations/location' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Locations)
      end
    end
  end
end

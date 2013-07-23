module Refinery
  module Locations
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Locations

      initializer "register refinerycms_locations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_locations"
          plugin.url = proc {  Refinery::Core::Engine.routes.url_helpers.locations_admin_locations_path }
          plugin.activity = { :class_name => :'refinery/locations/location' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Locations)
      end
    end
  end
end

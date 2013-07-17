module Refinery
  module Locations
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Locations

      initializer "register refinerycms_locations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_locations"
          plugin.url = proc { "/refinery/admin/locations" }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Locations)
      end
    end
  end
end

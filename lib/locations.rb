require 'refinery'

module Refinery
  module Locations
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "locations"
          plugin.activity = {:class => Location,
          :title => 'name'
        }
        end
      end
    end
  end
end

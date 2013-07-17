require 'refinerycms-core'
require 'debugger'

module Refinery
  autoload :LocationsGenerator, 'generators/refinery/locations/locations_generator'

  module Locations
    require 'refinery/locations/engine'
    require 'refinery/locations/configuration'


    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def tabs
        @tabs ||= []
      end

      def version
        ::Refinery::Locations::Version.to_s
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end

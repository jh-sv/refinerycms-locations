module Refinery
  module Locations
    class LocationsController < ::ApplicationController

      before_filter :find_all_locations
      before_filter :find_page

      def index
        render :json=>@locations.map(&:to_geojson_point)
      end

      def show
        @location = Location.find(params[:id])
        render :json=> @location.to_geojson_point
      end

    protected

      def find_all_locations
        @locations = Refinery::Locations::Location.find(:all, :order => "position ASC")
      end

      def find_page
        @page = Page.find_by_link_url("/locations")
      end

    end  
  end
end



























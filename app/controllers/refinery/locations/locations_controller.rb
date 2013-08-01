module Refinery
  module Locations
    class LocationsController < ::ApplicationController

      before_filter :find_all_locations
      before_filter :find_page

      def index
        render :json=>@locations
      end

      def show
        @location = Location.find(params[:id])
        render :json=> @location
      end

      def search
        render :json=> {}.to_json and return if params.blank?
        results = []
        term = ''
        if params[:country]
          term = params[:country]
          results = Refinery::Locations::Location.find_all_by_country(term)
        elsif params[:state]
          term = params[:state]
          results = Refinery::Locations::Location.find_all_by_state_or_province(term)
        elsif params[:city]
          term = params[:city] 
          results = Refinery::Locations::Location.near(term)
        elsif params[:zip]
          term = params[:zip]
          results = Refinery::Locations::Location.near(term)
        else

        end
        render :json=> results
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



























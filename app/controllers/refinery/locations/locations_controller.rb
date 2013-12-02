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
          term << params[:country]
          country = true
        end

        if params[:state]
          term << ' ' + params[:state]
          state = true
        end

        if params[:city]
          term << ' ' + params[:city] 
          city = true
        end

        if params[:zip]
          if term.blank?
            term = params[:zip]
          else
            term << params[:zip]
          end
        end

        results = Refinery::Locations::Location.near(term)  


        if params[:city].blank? && params[:state].blank? && params[:zip].blank?
            results = Refinery::Locations::Location.find_all_by_country(params[:country])
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



























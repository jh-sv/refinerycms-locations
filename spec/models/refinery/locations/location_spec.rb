require 'spec_helper'

module Refinery
	module Locations
		describe Location, "#exist" do
		  it "should exist" do
		    lambda{Refinery::Locations::Location}.should_not raise_error
		  end
		end
	end
end
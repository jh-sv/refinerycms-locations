require 'spec_helper'

describe "routes for Locations" do
	pending
  it "should route '/refinery/locations' to Refinery::Locations::Admin::LocationsController" do
  	expect(:get => '/refinery/locations/locations').to be_routable
  end
end
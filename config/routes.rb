Refinery::Core::Engine.routes.draw do
  namespace :locations do
    root :to => "locations#index"
  end

  namespace :locations, :path => '' do
    namespace :admin, :path => "/refinery/admin" do
      scope :path => "/locations" do
      end
    end
  end

  match '/refinery/locations' => "locations/admin/locations#index"
end

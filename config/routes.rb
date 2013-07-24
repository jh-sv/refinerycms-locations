Refinery::Core::Engine.routes.draw do
  namespace :locations do
    root :to => "locations#index"
  end

  namespace :locations, :path => Refinery::Locations.page_url do
    namespace :admin, :path => Refinery::Core.backend_route do
    	resources :locations
    end
  end

end

Refinery::Core::Engine.routes.draw do
  namespace :locations do
    root :to => "locations#index"
  end

  namespace :locations, :path => '' do
    namespace :admin, :path => "/refinery/admin" do
    	resources :locations
    end
  end

  match '/refinery/locations' => "admin/locations#index"
end

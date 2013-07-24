Refinery::Core::Engine.routes.draw do
  namespace :locations do
    root :to => "locations#index"
  end

  namespace :locations, :path => '' do
    namespace :admin, :path => 'refinery/locations' do
    	resources :locations
    end
  end

end

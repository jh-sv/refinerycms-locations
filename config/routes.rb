Refinery::Core::Engine.routes.draw do
  namespace :locations do
  	resources :locations
  end

  namespace :locations, :path => '' do
    namespace :admin, :path => 'refinery/locations' do
    	resources :locations
    end
  end

  namespace :locations, :path => '' do
    namespace :admin, :path => 'refinery/locations' do
    	resources :imports
    end
  end

end

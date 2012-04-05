Refinery::Application.routes.draw do
  resources :locations

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :locations do
      collection do
        post :update_positions
      end
    end
  end
end

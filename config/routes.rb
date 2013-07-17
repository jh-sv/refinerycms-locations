Refinery::Core::Engine.routes.draw do
  namespace :locations do
    root :to => "locations#index"
  end

  namespace :locations do
    namespace :admin, :path => "/refinery" do
      scope :path => "/locations" do
      end
    end
  end
end

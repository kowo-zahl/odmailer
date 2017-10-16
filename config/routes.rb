Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :odmailers
    end
end

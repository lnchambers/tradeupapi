Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :schools, only: [:show, :index, :create]
      resources :locations, only: [:index]
    end
  end
end

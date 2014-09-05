Rungo::Application.routes.draw do
  namespace :api do
    resources :users, only: [:create] do
      resources :settings, only: [:create, :index]
    end
    resources :sessions, only: [:create, :destroy]
    resources :non_directional_routes, controller: 'routes', 
      type: 'NonDirectionalRoutes', only: [:index]
    resources :agencies, only: [:index]
    # resources :user do
    #   resources :settings, only: [:create, :show]
    # end
  end
end

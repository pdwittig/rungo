Rungo::Application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
    resources :sessions, only: [:create, :destroy]
    resources :non_directional_routes, controller: 'routes', 
      type: 'NonDirectionalRoutes', only: [:index]
    resources :agencies, only: [:index]
  end
end

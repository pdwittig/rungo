Rungo::Application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
    resources :sessions, only: [:create, :destroy]
    resources :agencies, only: [:index]

    resources :non_directional_routes, controller: 'routes', 
      type: 'NonDirectionalRoutes', only: [:index]

    get 'settings/', to: 'settings#show'
    put 'settings/', to: 'settings#update'
  end
end

Rungo::Application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
    resources :sessions, only: [:create, :destroy]
  end
end

Rungo::Application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
  end
end

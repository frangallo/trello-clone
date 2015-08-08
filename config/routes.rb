Rails.application.routes.draw do
  root 'static_pages#root'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :boards
    resources :lists
    resources :cards do
      resources :items
    end
    resources :items
  end
end

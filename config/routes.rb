Rails.application.routes.draw do
  get 'sessions/new'
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end

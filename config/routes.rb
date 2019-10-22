Rails.application.routes.draw do
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]

  namespace :admin do
    resources :users, only:[:index, :edit, :new, :create, :show, :update, :destroy]
  end
end

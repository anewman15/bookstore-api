Rails.application.routes.draw do
  resources :books, only: [:index, :create, :update, :destroy]

  namespace :user do
    resources :sessions, only: [:new, :create]
  end

  resources :users, except: [:edit, :update, :destroy]
end

Rails.application.routes.draw do
  resources :books, only: :index

  namespace :user do
    resources :sessions, only: [:new, :create]
  end

  resources :users, except: [:edit, :update, :destroy] do
    resources :books
  end
end

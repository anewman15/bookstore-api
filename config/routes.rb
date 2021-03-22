Rails.application.routes.draw do
  resources :users, except: [:edit, :update, :destroy]

  namespace :user do
    resources :sessions, only: [:new, :create]
  end

  resources :books, only: [:index, :create, :update, :destroy], defaults: { format: :json }
  resource :books, only: [:destroy, :update]

  root to: redirect('https://anewman15-book-tracker.netlify.app/')
end

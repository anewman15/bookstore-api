Rails.application.routes.draw do
  get 'books/new'
  get 'books/edit'
  get 'books/index'
  get 'books/show'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users, except: [:edit, :update, :destroy] do
    resources :books
  end

  devise_scope :user do
    root 'users/sessions#new'
  end
end

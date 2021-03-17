Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users, except: [:edit, :update, :destroy] do
    resources :books, except: :show
  end

  devise_scope :user do
    root 'users/sessions#new'
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'tournaments#index'

  resources :tournaments, only: [:index, :new, :create, :edit, :update, :show] do
    resources :groups, only: [:index]
    resources :entries, only: [:create]
  end
end

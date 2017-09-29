Rails.application.routes.draw do
  devise_for :users
  root to: 'tournaments#index'

  resources :tournaments, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :groups, only: [:index]
    resources :entries, only: [:create]
    resources :games, only: [:update]
    post "/start_knockout_round", to: "tournaments#start_knockout_round"
  end
end

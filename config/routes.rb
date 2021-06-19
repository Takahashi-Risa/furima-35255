Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items, only: [:index, :new, :create ] do
    # :show,:edit,:destroyを追記する
  end
end

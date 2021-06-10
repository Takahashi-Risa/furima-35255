Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users
  
  resources :items, only: [:edit, :index, :new, :create, :show, :destroy]do
  end
  
end
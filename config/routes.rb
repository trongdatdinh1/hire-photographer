Rails.application.routes.draw do
  root to: "static_pages#home"
  devise_for :photographers, controllers: {
    registrations: 'photographers/registrations'
  }
  devise_for :customers
  resources :posts
  resources :requests, only: [:create, :destroy]
  resources :galleries, only: [:new, :create, :show]
end

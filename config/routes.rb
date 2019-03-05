Rails.application.routes.draw do
  root to: "static_pages#home"
  devise_for :photographers, controllers: {
    registrations: 'photographers/registrations'
  }
  devise_for :customers
  resources :posts do
    resources :messages, only: :create
  end
  resources :requests, only: [:create, :destroy]
  resources :galleries, only: [:new, :create, :show]
  resources :request_handlers, only: [:create]
end

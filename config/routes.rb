Rails.application.routes.draw do
  root to: "static_pages#home"
  devise_for :photographers, controllers: {
    registrations: "photographers/registrations"
  }
  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    omniauth_callbacks: "customers/omniauth_callbacks"
  }
  resources :posts do
    resources :messages, only: :create
  end
  resources :requests, only: [:create, :destroy]
  resources :galleries, only: [:new, :create, :show]
  resources :request_handlers, only: [:create]
  resource :phone_verification, only: [:create, :edit, :update]

  mount ActionCable.server => "/cable"
end

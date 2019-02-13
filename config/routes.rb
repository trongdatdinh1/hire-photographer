Rails.application.routes.draw do
  root to: "static_pages#home"
  devise_for :photographers, controllers: {
    registrations: 'photographers/registrations'
  }
  devise_for :customers
  resources :posts
end

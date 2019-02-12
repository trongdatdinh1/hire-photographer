Rails.application.routes.draw do
  devise_for :photographers, controllers: {
    registrations: 'photographers/registrations'
  }
  devise_for :customers
end

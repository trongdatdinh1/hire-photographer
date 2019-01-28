Rails.application.routes.draw do
  devise_for :photographers
  devise_for :customers
end

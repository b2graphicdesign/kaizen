Rails.application.routes.draw do
  devise_for :admins
  devise_for :transit_providers
  devise_for :providers

  root "pages#home"

  resources :rides
end

Rails.application.routes.draw do
  devise_for :transit_providers
  devise_for :providers
  root "pages#home"
end

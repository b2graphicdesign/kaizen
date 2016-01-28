Rails.application.routes.draw do
  devise_for :providers
  root "pages#home"
end

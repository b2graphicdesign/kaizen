Rails.application.routes.draw do
  devise_for :drivers
  devise_for :transportations
  devise_for :patients
  devise_for :admins
  devise_for :transit_providers
  devise_for :providers

  root "pages#home"
  resources :rides
  resources :patients

  post 'sms/voice' => 'sms_messages#voice'
end

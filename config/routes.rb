Rails.application.routes.draw do

  namespace :patient do
  get 'steps/show'
  end

  namespace :patient do
  get 'steps/update'
  end

  namespace :patient do
  get 'steps_controller/show'
  end

  namespace :patient do
  get 'steps_controller/update'
  end

  devise_for :drivers
  devise_for :transportations
  devise_for :patients
  devise_for :admins
  devise_for :transit_providers
  devise_for :providers

  root "pages#home"
  resources :rides
  resources :patients do 
    resources :steps, only: [:show, :update], controller: 'patient/steps'
  end
  
  get "transportation/new" => "transportations#new"
  post "transportation" => "transportations#create"

  get 'provider/new' => 'providers#new'
  post 'provider' => 'providers#create'

  post 'sms/voice' => 'sms_messages#voice'

  

end

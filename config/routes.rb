Rails.application.routes.draw do

  post 'sms/voice' => 'sms_messages#voice'
  post 'sms/notify' => 'sms_messages#notify'

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
  
  get 'transportation' => 'transportations#index'
  get 'transportation/new' => 'transportations#new'
  post 'transportation' => 'transportations#create'

  get 'provider' => 'providers#index'
  get 'provider/new' => 'providers#new'
  post 'provider' => 'providers#create'

  


  

end

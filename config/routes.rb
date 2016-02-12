Rails.application.routes.draw do

  namespace :driver do
  get 'steps/show'
  end

  namespace :driver do
  get 'steps/update'
  end

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
  resources :drivers do 
    resources :steps, only: [:show, :update], controller: 'driver/steps'
  end
  
  get "transportation/new" => "transportations#new"
  post "transportation" => "transportations#create"

  post 'sms/voice' => 'sms_messages#voice'

    get 'provider/new' => 'providers#new'
    post 'provider' => 'providers#create'

end

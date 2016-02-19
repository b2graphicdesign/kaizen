Rails.application.routes.draw do


  namespace :driver do
  get 'steps/show'
  end

  namespace :driver do
  get 'steps/update'
  end

  post 'sms/voice' => 'sms_messages#voice'
  post 'sms/notify' => 'sms_messages#notify'


  namespace :patient do
  get 'steps/show'
  end

  namespace :patient do
  get 'steps/update'
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
  
  get 'patient' => 'patients#index'
  get 'patient/:id' => 'patients#show'

  get 'transportation' => 'transportations#index'
  get 'transportation/new' => 'transportations#new'
  post 'transportation' => 'transportations#create'
  get '/transportation/:id/edit' => 'transportations#edit'
  put '/transportation/:id' => 'transportations#update'
  get '/transportation/:id' => 'transportations#show'

  get '/provider' => 'providers#index'
  get '/provider/new' => 'providers#new'
  post '/provider' => 'providers#create'
  get '/provider/:id/edit' => 'providers#edit'
  put '/provider/:id' => 'providers#update'
end
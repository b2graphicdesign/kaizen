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
  devise_for :admins, :controllers => { registrations: 'registrations' }
  devise_for :transit_providers
  devise_for :providers

  root 'pages#home'
  resources :rides
  resources :patients do
    resources :steps, only: [:show, :update], controller: 'patient/steps'
  end
  resources :drivers do
    resources :steps, only: [:show, :update], controller: 'driver/steps'
  end

  get '/driver/:id' => 'drivers#show'

  get '/patient' => 'patients#index'
  get '/patient/:id' => 'patients#show'

  get '/transportation' => 'transportations#index'
  get '/transportation/new' => 'transportations#new'
  post '/transportation' => 'transportations#create'
  get '/transportation/:id/edit' => 'transportations#edit'
  put '/transportation/:id' => 'transportations#update'
  get '/transportation/:id' => 'transportations#show'
  get '/transportation/:id/edit_transportation' => 'transportations#edit_transportation'
  patch '/transportation/:id' => 'transportations#update_transportation'

  get '/provider' => 'providers#index'
  get '/provider/new' => 'providers#new'
  post '/provider' => 'providers#create'
  get '/provider/:id/edit' => 'providers#edit'
  put '/provider/:id' => 'providers#update'
  get '/provider/:id' => 'providers#show'
  get '/provider/:id/edit_provider' => 'providers#edit_provider'
  patch '/provider/:id' => 'providers#update_provider'

  get '/ride' => 'rides#index'
  get '/patient/:id/schedule' => 'rides#new'
  post '/ride' => 'rides#create'

end
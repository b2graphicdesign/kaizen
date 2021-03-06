Rails.application.routes.draw do

  # namespace :driver do
  # get 'steps/show'
  # end

  # namespace :driver do
  # get 'steps/update'
  # end

  post 'sms/voice' => 'sms_messages#voice'
  post 'sms/notify' => 'sms_messages#notify'

  # namespace :patient do
  # get 'steps/show'
  # end

  # namespace :patient do
  # get 'steps/update'
  # end

  # devise_for :drivers
  devise_for :transportations
  # devise_for :patients
  devise_for :admins, :controllers => { registrations: 'registrations' }
  devise_for :providers


  root 'pages#home'
  resources :rides

  resources :patients

  # resources :patients do
  #   resources :steps, only: [:show, :update], controller: 'patient/steps'
  # end
  # resources :drivers do
  #   resources :steps, only: [:show, :update], controller: 'driver/steps'
  # end

  get '/patientEhr' => 'patient_ehr#index'
  post '/patientEhr/search' => 'patient_ehr#search'
  # get 'driver' => 'drivers#index'
  # get '/driver/:id' => 'drivers#show'
  # get '/driver/:id/edit_driver' => 'drivers#edit_driver'
  # patch '/driver/:id' => 'drivers#update_driver'
  # delete '/driver/:id' => 'drivers#destroy'

  # get '/patient' => 'patients#index'
  # get '/patient/:id' => 'patients#show'
  # get '/patient/:id/edit_patient' => 'patients#edit_patient'
  # patch '/patient/:id' => 'patients#update_patient'
  # delete '/patient/:id' => 'patients#destroy'

  get '/transportation' => 'transportations#index'
  get '/transportation/new' => 'transportations#new'
  post '/transportation' => 'transportations#create'
  get '/transportation/:id' => 'transportations#show'
  get '/transportation/:id/edit' => 'transportations#edit'
  put '/transportation/:id' => 'transportations#update'
  get '/transportation/:id/edit_transportation' => 'transportations#edit_transportation'
  patch '/transportation/:id' => 'transportations#update_transportation'
  delete '/transportation/:id' => 'transportations#destroy'


  get '/provider' => 'providers#index'
  get '/provider/new' => 'providers#new'
  post '/provider' => 'providers#create'
  get '/provider/:id' => 'providers#show'
  get '/provider/:id/edit' => 'providers#edit'
  put '/provider/:id' => 'providers#update'
  get '/provider/:id/edit_provider' => 'providers#edit_provider'
  patch '/provider/:id' => 'providers#update_provider'
  delete '/provider/:id' => 'providers#destroy'

  get '/ride' => 'rides#index'
  get '/patient/:id/schedule' => 'rides#new'
  post '/ride' => 'rides#create'
  get '/ride/:id' => 'rides#show'
  get 'ride/:id/edit' => 'rides#edit'
  patch '/ride/:id' => 'rides#update'
  delete '/ride/:id' => 'rides#destroy'

end
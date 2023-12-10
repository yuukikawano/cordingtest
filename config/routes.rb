Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'admin/users/new', to: 'admin/user_controller#create'
  resources :users
  get '/recordattends', to: 'recordattends#index'
  namespace :admin do 
    resources :users
  end 
  post '/recordattends', to: 'recordattends#editrecord'
  get  '/recordattends/show', to: 'recordattends#showrecord'
  post '/recordattends/show', to: 'shiftcalendars#create'
  
end

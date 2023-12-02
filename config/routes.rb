Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  get '/recordattends', to: 'recordattends#index'
  namespace :admin do 
    resources :users, :recordattends 
  end 
  post '/recordattends/editrecord', to: 'recordattends#editrecord'
end

Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  get '/recordattends', to: 'recordattends#index'
  namespace :admin do 
    resources :users
  end 
  post '/recordattends', to: 'recordattends#editrecord'
  get  '/recordattends/show', to: 'recordattends#showrecord'
end

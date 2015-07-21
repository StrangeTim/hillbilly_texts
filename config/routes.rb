Rails.application.routes.draw do
  root :to => "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: ["show", "index"]
  resources :messages, except: [:edit, :update, :destroy]
  resources :contacts
  get '/inbound_messages', to: 'messages#inbound_message'
  post '/inbound_messages', to: 'messages#inbound_message'


end

Rails.application.routes.draw do
  root :to => "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: ["show", "index"]
  resources :messages, except: [:edit, :update, :destroy]
  resources :contacts

end

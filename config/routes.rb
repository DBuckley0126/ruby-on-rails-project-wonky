Rails.application.routes.draw do

  resources :listings
  resources :purchases
  resources :users

  resources :farmers do 
    resources :listings
  end

  root 'listings#index'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

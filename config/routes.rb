Rails.application.routes.draw do

  resources :listings, only: [:index, :show]
  resources :sessions, only: [:create, :delete]

  root :to => "listings#index"
  
  get '/signup', to: 'application#signup'
  get '/login', to: 'application#login'
  get '/logout', to: 'sessions#delete'


  resources :farmers, only: [:show, :create, :edit, :update] do
    resources :listings
    resources :purchases, only: [:index, :show]
  end

  resources :users, only: [:show, :create, :edit, :update] do
    resources :purchases
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  resources :listings, only: [:index, :show]

  root :to => "listings#index"
  
  get '/signup', to: 'application#signup'
  get '/login', to: 'application#login'


  resources :farmers do
    resources :listings
    resources :purchases, only: [:index, :show]
  end

  resources :users do
    resources :purchases
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

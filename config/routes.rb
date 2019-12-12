Rails.application.routes.draw do

  resources :listings, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]

  root :to => "listings#index"
  
  get '/signup', to: 'application#signup'
  get '/login', to: 'application#login'
  get '/logout', to: 'sessions#delete'

  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/:google_oauth2/callback', to: 'google_auth#new', as: 'google_new'

  post '/auth/google_oauth2/finalise', to: 'google_auth#create', as: 'google_create'


  resources :farmers, only: [:show, :create, :edit, :update] do
    resources :listings
  end

  resources :users, only: [:show, :create, :edit, :update] do
    resources :purchases, only: [:new, :create, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'bets/create'
  get 'events/create'
  get 'participations/show'
  get 'contests/show'
  get 'contests/new'
  get 'contests/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :contests, only: [:show, :new, :create] do
  end
  
  resources :participations, only: [:show] do
    resources :events, only: [:create]
    resources :bets, only: [:create]
  end
  
  get '/dashboard', to: "pages#dashboard"
  post '/dashboard', to: "participations#create" #create participation to an existing contest, using a code
end
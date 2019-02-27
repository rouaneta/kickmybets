Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contests, only: [:show, :new, :create]

  resources :participations, only: [:show, :new, :create] do
    resources :events, only: [:create]
    resources :bets, only: [:create]
  end

  get '/dashboard', to: "pages#dashboard"
  post '/dashboard', to: "participations#create" #create participation to an existing contest, using a code

end

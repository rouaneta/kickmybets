Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contests, only: [:show, :new, :create] do
    member do
      get 'ranking', to: 'pages#ranking'
      post :invite
      resources :games, only: [:update] do
        member do
          patch 'update_status'
        end
      end
    end
  end

  resources :participations, only: [:show, :new, :create] do
    resources :events, only: [:create, :edit, :update] do
      member do
        patch 'update_status'
      end
    end
    resources :comments, only: [:create]
    resources :bets, only: [:create]
  end

  get '/dashboard', to: "pages#dashboard"
  post '/dashboard', to: "participations#create" #create participation to an existing contest, using a code

end

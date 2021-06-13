Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  root :to => "sessions#new"
  get 'sessions/new'
  get 'friendships/create'
  get '/search', to: 'users#search'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :friendships, only: %i[create] do
      collection do
        get 'accept_friend'
        get 'decline_friend'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

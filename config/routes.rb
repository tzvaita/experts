Rails.application.routes.draw do
  get 'friendships/create'
  get '/search', to: 'users#search'
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

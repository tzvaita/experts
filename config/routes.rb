Rails.application.routes.draw do
  get 'friendships/create'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

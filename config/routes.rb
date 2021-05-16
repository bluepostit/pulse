Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/users/search', to: 'users#search', as: 'search_user'

  resources :users, only: :show
  resources :checkins, only: %i[new create show]
end

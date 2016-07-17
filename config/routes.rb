Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  get 'page/index'
  root 'page#index'

  # root 'static#welcome'
  # get 'static/welcome'

end

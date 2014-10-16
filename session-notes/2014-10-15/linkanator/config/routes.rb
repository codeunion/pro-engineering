Rails.application.routes.draw do
  root to: 'links#index'

  resources :links, only: [:new, :create]

  resources :users, only: [:new, :create]

  controller :sessions do
    post '/login',  action: 'create'
    get  '/logout', action: 'destroy'
  end
end

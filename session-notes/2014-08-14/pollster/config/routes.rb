Rails.application.routes.draw do
  root to: 'polls#index'

  resources :users, only: [:new, :create]

  resources :polls, except: [:index] do
    resources :votes, only: [:new, :create]
  end

  controller :sessions do
    post '/login',  action: 'create'
    get '/logout', action: 'destroy'
  end
end

# POST /votes
# POST /polls/123/votes (create a new vote for poll 123)
# /polls/123/vote/10

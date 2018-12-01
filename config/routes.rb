Rails.application.routes.draw do

  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'favorites', to: 'favorites#create'
      get 'favorites', to: 'favorites#index'
      delete 'favorites', to: 'favorites#destroy'
    end
  end
end

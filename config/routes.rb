Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'favorites', to: 'favorites#create'
    end
  end
end

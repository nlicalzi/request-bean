Rails.application.routes.draw do
  root to: 'bins#index'

  resources :users, except: %i[index edit update]
  resources :requests, only: %i[show destroy]
  resources :bins

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  get '/rq/:bin_url', to: 'requests#log_request'
  post '/rq/:bin_url', to: 'requests#log_request'
  put '/rq/:bin_url', to: 'requests#log_request'
  patch '/rq/:bin_url', to: 'requests#log_request'
  delete '/rq/:bin_url', to: 'requests#log_request'
end

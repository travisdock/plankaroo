Rails.application.routes.draw do
  resources :cohorts
  resources :planks
  resources :events
  resources :users

  get '/logout' => 'sessions#destroy'
  get '/login' => "sessions#new"
  post 'sessions' => "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

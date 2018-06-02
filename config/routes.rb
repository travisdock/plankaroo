Rails.application.routes.draw do
  resources :cohorts
  resources :planks
  resources :events
  resources :users

  get '/logout' => 'sessions#destroy'
  get '/login' => "sessions#new"
  post 'sessions' => "sessions#create"
  get 'future' => "events#future"
  post 'events/:id/signup' => "events#signup", as: 'event_signup'
  get '/' => "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

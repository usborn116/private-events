Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations" }
  get 'events/index'
  
  root to: "events#index"
  resources :events
  get '/users/:id', to: 'users#show', as: "user"
  post '/users/:user_id/events/:id', to: 'attending_events#create', as: 'create_attending_event'
  get '/users/:id/attended_events', to: 'users#show_attended_events', as: 'show_attended_events'
  delete '/users/:user_id/events/:id', to: 'attending_events#destroy', as: 'destroy_attending_event'
  # Defines the root path route ("/")
  # root "articles#index"
end

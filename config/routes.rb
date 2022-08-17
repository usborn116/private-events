Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations" }
  get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :events
  get '/users/:id', to: 'users#show', as: "user"
  post '/users/:user_id/events/:id', to: 'attending_events#create', as: 'create_attending_event'
  get '/users/:id/attended_events', to: 'users#show_attended_events', as: 'show_attended_events'
  # Defines the root path route ("/")
  # root "articles#index"
end

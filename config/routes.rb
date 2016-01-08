Rails.application.routes.draw do

  # ROOT routes
  root 'application#welcome'

  # USERS routes
  get '/users/:id' => 'users#show', defaults: {format: :json}
  post '/users' => 'users#create', defaults: {format: :json}
  get '/users/:id/edit' => 'users#edit', defaults: {format: :json}
  patch '/users/:id' => 'users#update', defaults: {format: :json}
  delete '/users/:id' => 'users#destroy', defaults: {format: :json}

  # STORIES / EDITS routes
  resources :stories, defaults: {format: :json } do
    resources :edits, shallow: true
  end

  # SESSION routes
  get '/session' => 'session#user_current', defaults: { format: :json }
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'

end

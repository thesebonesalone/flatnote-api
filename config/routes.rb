Rails.application.routes.draw do
  resources :notes
  resources :users
  resources :welcome

  get '/users/:username/notes', to: 'users#getnotes'
  post '/auth', to: 'auth#create'
end

Rails.application.routes.draw do
  resources :notes
  resources :users

  get '/users/:username/notes', to: 'users#getnotes'
end

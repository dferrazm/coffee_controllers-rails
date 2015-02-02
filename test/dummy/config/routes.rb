Rails.application.routes.draw do
  get '/home', to: 'main#home'
  get '/dashboard', to: 'main#dashboard'
  get '/deferred', to: 'deferred#index'
end

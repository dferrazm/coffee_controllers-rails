Rails.application.routes.draw do
  get '/home', to: 'main#home'
  get '/dashboard', to: 'main#dashboard'
end

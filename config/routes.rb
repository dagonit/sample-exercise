Rails.application.routes.draw do
  post '/api/v1/users', to: 'api/v1/users#create'
end

Rails.application.routes.draw do
  get '/' => 'meetings#index'

  get '/meetings' => 'meetings#index'
  get '/meetings/new' => 'meetings#new'
  get '/meetings/:id' => 'meetings#show'
  post '/meetings' => 'meetings#create'
  get '/meetings/:id/edit' => 'meetings#edit'
  patch '/meetings/:id' => 'meetings#update'
end

Rails.application.routes.draw do
  get '/', to: 'ping#index'

  namespace :api do
  	namespace :v1 do
  	  resources :users, param: :_id
  	  post '/login', to: 'authentication#login'
  	end
  end

end

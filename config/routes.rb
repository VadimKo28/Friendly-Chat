Rails.application.routes.draw do
  
  devise_for :users
  root "rooms#index"
  resources :rooms do 
    resources :messages
  end
  get '/users/:id', to: 'users#show', as: "users"

end


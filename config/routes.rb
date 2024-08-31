Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    resources :comments
  end

  resources :categories do
    get '/products', to: 'categories#products', as: 'category_products'
  end

  get '/profile', to: 'profiles#show'
  
  patch '/profile', to: 'profiles#update'

  post '/bind_telegram', to: 'profiles#bind_telegram'

  
end

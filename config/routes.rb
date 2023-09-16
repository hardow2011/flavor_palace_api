Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authentication/create'

      # overwrite the images create route
      post 'images/:product_option_id', to: 'images#create'
      resources :images, except: :create

      resources :product_options
      get 'products/:permalink', to: 'products#find_by_permalink'
      resources :products
      resources :delivery_infos
      resources :orders
      resources :customers
      resources :employees
      resources :users
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

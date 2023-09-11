Rails.application.routes.draw do
  resources :images
  resources :product_options
  get 'products/:permalink', to: 'products#find_by_permalink'
  resources :products
  resources :delivery_infos
  resources :orders
  resources :customers
  resources :employees
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

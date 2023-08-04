Rails.application.routes.draw do
  resources :mascotas
  devise_for :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mascotas#index"
end

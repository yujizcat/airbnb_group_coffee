Rails.application.routes.draw do
  devise_for :users
  match "users/:id" => "users#destroy", :via => :delete, :as => :admin_destroy_user
  # match "users/:id" => "users#show", as: :user
  # resources :users
  resources :properties
  resources :bookings
  resources :favorites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "properties#index"
  get "properties/_form", to: "properties#_form"
end

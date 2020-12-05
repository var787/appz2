Rails.application.routes.draw do
  resources :vehicles
  root 'home#page'
  devise_for :users
  get 'search/vehicles/:vehicle_type/' => 'vehicles#search', as: :search_vehicles
end

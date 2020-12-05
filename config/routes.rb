Rails.application.routes.draw do
  root 'home#page'
  devise_for :users
end

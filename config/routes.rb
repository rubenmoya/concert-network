Rails.application.routes.draw do
  devise_for :users
  root 'concerts#index'
  resources :concerts
end

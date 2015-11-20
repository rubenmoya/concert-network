Rails.application.routes.draw do
  root 'concerts#index'
  resources :concerts
end

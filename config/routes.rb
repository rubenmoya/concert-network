Rails.application.routes.draw do
  devise_for :users
  root 'concerts#index'

  get  '/search' => 'concerts#search'
  post '/search' => 'concerts#search'

  resources :concerts do
    resources :comments, only: [:create, :destroy]
  end
end

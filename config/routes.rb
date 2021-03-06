Rails.application.routes.draw do
  devise_for :users
  root 'concerts#index'

  get  '/search' => 'concerts#search'
  post '/search' => 'concerts#search'

  get '/top_ten' => 'concerts#top_ten'

  resources :concerts do
    resources :comments, only: [:create, :destroy]
  end
end

Rails.application.routes.draw do
  root 'users#index'
  get 'users' => 'users#index'
  post 'users' => 'users#create'

  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

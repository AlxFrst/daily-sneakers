Rails.application.routes.draw do
  devise_for :users
  root to: 'sneakers#index'
  resources :sneakers, only: [:index, :show]
end

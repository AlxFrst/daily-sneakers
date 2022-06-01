Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sneakers, only: [:index, :show]
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sneakers, only: [:index, :show]
  get "wishlist", to: "dashboards#wishlist"
  get "collection", to: "dashboards#collection"
  get "profile", to: "dashboards#profile"
end

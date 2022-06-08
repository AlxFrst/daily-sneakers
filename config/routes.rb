Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sneakers, only: [:index, :show] do
    resources :collections, only: [:new, :create, :destroy, :update]
    resources :wishlists, only: [:new, :create, :destroy, :update]
  end
  get "wishlist", to: "dashboards#wishlist"
  get "collection", to: "dashboards#collection"
  get "profile", to: "dashboards#profile"
end

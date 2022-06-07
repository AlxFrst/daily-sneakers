Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sneakers, only: [:index, :show]
  post "/sneakers/:id/add_to_wishlist", to: "sneakers#add_to_wishlist", as: "add_to_wishlist"
  get "wishlist", to: "dashboards#wishlist"
  get "collection", to: "dashboards#collection"
  get "profile", to: "dashboards#profile"
end

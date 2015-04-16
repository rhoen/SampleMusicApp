MusicApp::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  root to: redirect("/users/new")
  resources :bands, only: [:new, :create, :show]
  resources :albums, only: [:new, :create, :show]
  resources :tracks, only: [:new, :create, :show]
end

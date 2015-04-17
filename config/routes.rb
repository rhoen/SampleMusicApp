MusicApp::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  root to: redirect("/users/new")
  resources :bands, only: [:new, :create, :show, :index] do
     resources :albums, only: [:new]
  end
  resources :albums, only: [:new, :create, :show, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:new, :create, :show, :destroy]
end

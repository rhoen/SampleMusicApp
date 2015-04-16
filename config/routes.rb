MusicApp::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :delete]
  root to: redirect("/users/new")
end

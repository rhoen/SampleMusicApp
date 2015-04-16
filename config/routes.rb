MusicApp::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions
  root to: redirect("/users/new")
end

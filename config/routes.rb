Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to:  "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "session#destroy"

  get "admin", to: "admins/home#index"
  get "admin/login", to: "admins/sessions#new"
  post "admin/login", to: "admins/sessions#create"

end

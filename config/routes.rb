Rails.application.routes.draw do
  get 'exams/index'

  get 'exams/show'

  root "sessions#new"

  get "/login", to:  "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :exams
  resources :user_exams
  resources :exam_results

  get "admin", to: "admins/home#index"
  get "admin/login", to: "admins/sessions#new"
  post "admin/login", to: "admins/sessions#create"
  delete "admin/logout", to: "admins/sessions#destroy"

  namespace :admins do
    resources :categories
    resources :questions
    resources :exams
    resources :exam_categories
    resources :exam_questions
  end
end

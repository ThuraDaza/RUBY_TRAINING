Rails.application.routes.draw do
  root "login#index"
  
  resources :users do
    resources :articles
  end
  
  get 'login/index'
  post "sign_in", to: "login#sign_in"
  post "sign_out", to: "login#sign_out"
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to:  "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end

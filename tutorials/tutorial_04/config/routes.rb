Rails.application.routes.draw do

  get "/login", to: "login_form#login"
  post "login", to: "login_form#submit_login"
  get "/welcome", to: "login_form#welcome"
  post "logout", to: "login_form#clear_session"

end

Rails.application.routes.draw do
  get "/age_calculator", to: "age_calculator#age_form"
  post "age_calculator", to: "age_calculator#age_form"
  get "/age_result", to: "age_calculator#age_result"
end

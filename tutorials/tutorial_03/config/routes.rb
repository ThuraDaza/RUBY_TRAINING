Rails.application.routes.draw do

  get "/age_calculator", to: "age_calculator#age_form"
  post "calculate_age", to: "age_calculator#calculate_age"
  get "/age_result", to: "age_calculator#age_result"
  root "age_calculator#age_form"

end

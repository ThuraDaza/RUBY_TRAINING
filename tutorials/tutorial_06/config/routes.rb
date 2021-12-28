Rails.application.routes.draw do

  get "/folder_creation", to: "folder_creation#read_file"
  post "folder_creation", to: "folder_creation#read_input_file"
  get "/show_file", to: "folder_creation#show_file"

  root "folder_creation#read_file"

end

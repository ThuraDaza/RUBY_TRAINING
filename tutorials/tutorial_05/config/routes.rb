Rails.application.routes.draw do

  get "/file_reader", to: "file_reader#read_file"
  post "file_reader", to: "file_reader#read_input_file"
  get "/show_file", to: "file_reader#show_file"

end

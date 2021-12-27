Rails.application.routes.draw do

  controller :qr_generator do
    get :build_qr
    get :show_qr
    get :qr_code_download
  end

end

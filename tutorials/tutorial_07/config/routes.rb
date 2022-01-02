Rails.application.routes.draw do

  controller :qr_generator do
    get :build_qr
    get :show_qr
  end

end

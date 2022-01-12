class LoginController < ApplicationController
  skip_before_action :authorized, only: [:index, :sign_in]
  
  def index
  end

  def sign_in
    @user = UserService.find_by_email(params[:email])

    # check if authenticate or not
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to users_path
    else
        redirect_to root_path, notice: "Login failed, authentication error occurs!!"
    end
  end

  def sign_out
    session.clear
    redirect_to root_path
  end

end

class PasswordResetsController < ApplicationController
  skip_before_action :authorized

  def new
  end

  def create
    @user = UserService.find_by_email(params[:email])

    if @user.present? 
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "If this account existed, we'll send a link to reset password"
  end

  def edit 
    @user = User.find_signed!(params[:token], purpose: "password reset")

    # for expire token 
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to root_path, notice: "Your token has expired, Please try again!!!"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password reset")
    password = params[:password]
    confirm_password = params[:password_confirmation]

    # check password confirmation same with password
    if password == confirm_password
      # update password 
      if UserService.update_password(@user, password)
        redirect_to root_path, notice: "Your password was reset successfully."
      else
        render :edit
      end

    else
      redirect_to password_reset_edit_url(token: params[:token] ), notice: "Password did not match"
    end

  end

end

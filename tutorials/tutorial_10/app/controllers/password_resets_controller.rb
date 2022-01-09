class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

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
      redirect_to root_path, alert: "Your token has expired, Please try again!!!"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password reset")
    password = params.require(:user).permit(:password)
    confirm_password = params.require(:user).permit(:password_confirmation)

    # check password confirmation same with password
    if password[:password] == confirm_password[:password_confirmation]
      # update password 
      if @user.update(password_params)
        redirect_to root_path, notice: "Your password was reset successfully."
      else
        render :edit
      end

    else
      redirect_to password_reset_edit_url(token: params[:token] ), notice: "Password did not match"
    end

  end

  private
  def password_params
    params.require(:user).permit(:password)
  end
end

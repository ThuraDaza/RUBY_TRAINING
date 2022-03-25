class UserMailer < ApplicationMailer
  def success_create
    @created_user = params[:user]
    @current_user = params[:current_user]
    mail to: @current_user.email
  end
end

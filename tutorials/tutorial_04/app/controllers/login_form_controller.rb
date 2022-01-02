class LoginFormController < ApplicationController

  def login
    # check user still logged in?
    if session[:isAuth] == true
      redirect_to welcome_path
    end

  end

  def submit_login
    @email = "thura@gmail.com"
    @pwd = "12345"

    # check input fiels have values?
    if params.has_key?(:email) && params.has_key?(:password)
      @user_email = params[:email]
      @user_pwd = params[:password]

      # check to sign in 
      if @email == @user_email && @pwd == @user_pwd

        session[:isAuth] = true
        # go to welcome page
        redirect_to welcome_path

      # for wrong input
      else
        redirect_to login_path
    
      end

    end
  end

  def welcome
    # check user not log in?
    unless session[:isAuth] == true
      redirect_to login_path
    end 

  end

  def clear_session

    # log out
    session.clear
    redirect_to login_path

  end

end

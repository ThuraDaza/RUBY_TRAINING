class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # create a new user
  def create
    @user = User.new(user_params)

    # check new user is save or not
    if @user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end

  end

  def edit
    # store id to make operation specific row
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # update user's data
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete user
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
    end

end

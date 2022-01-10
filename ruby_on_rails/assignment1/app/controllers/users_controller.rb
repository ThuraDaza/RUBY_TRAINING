class UsersController < ApplicationController

  def index 
    @users = UserService.getAllUsers
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
    @is_user_create = UserService.createUser(@user)

    # check new user is create or not
    if @is_user_create
      redirect_to users_path
    else
      redirect_to new_user_path, notice: "User creation failed, validation error occurs!!"
    end

  end

  def edit
    @user = UserService.getUserByID(params[:id])
  end

  def update
    @user = UserService.getUserByID(params[:id])
    @is_user_update = UserService.updateUser(@user, user_params)

    # update user's data
    if @is_user_update
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete user
  def destroy
    @user = UserService.getUserByID(params[:id])
    UserService.destroyUser(@user)

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
    end

end

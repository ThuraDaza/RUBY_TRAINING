class UsersController < ApplicationController

  def index 
    if (params.has_key?(:name) && params.has_key?(:email) && params.has_key?(:super_user_flag) && params.has_key?(:phone) && params.has_key?(:address) && params.has_key?(:birthday))
      # get sql query string
      @sql_str = UserService.createSqlString(params[:name], params[:email], params[:super_user_flag], params[:phone], params[:address], params[:birthday])
      puts "sql query is #{@sql_str}"

      if @sql_str == ""
        @users = UserService.getAllUsers
        flash.now[:notice] = "Search failed, You need to put at least one input field to search!!"
      else
        @users = UserService.searchUser(@sql_str)
        flash.now[:notice] = "Search failed!! There is no appropriate search data" if @users.length() == 0
      end

    else
      @users = UserService.getAllUsers
    end
  end

  def show
    @user = UserService.getUserByID(params[:id])
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
      redirect_to new_user_path
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

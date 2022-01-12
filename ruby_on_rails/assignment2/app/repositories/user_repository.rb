class UserRepository
  class << self
    # get all users
    def get_all_users
      @users = User.all
    end

    # search user
    def search_user(sql_str)
      @users = User.find_by_sql("
        SELECT * FROM users
        WHERE #{sql_str}
        ")
    end

    # create user
    def create_user(user)
      @is_user_create = user.save
    end

    # get user using user_id
    def get_user_by_id(id)
      @user = User.find(id)
    end

    # update user
    def update_user(user, user_params)
      @is_update_user = user.update(user_params)
    end

    # delete User
    def destroy_user(user)
      user.destroy
    end

    # find user using email
    def find_by_email(email)
      @user = User.find_by(email: email)
    end

    # update user password
    def update_password(user, password)
      @is_update_password = user.update_attribute(:password, password)
    end
  end
end
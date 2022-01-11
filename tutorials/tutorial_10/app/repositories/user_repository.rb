class UserRepository
  class << self
      # get all users
      def getAllUsers
          @users = User.all
      end

      # create user
      def createUser(user)
          @is_user_create = user.save
      end

      # get user using user_id
      def getUserByID(id)
          @user = User.find(id)
      end

      # update user
      def updateUser(user, user_params)
          @is_update_user = user.update(user_params)
      end

      # delete User
      def destroyUser(user)
          user.destroy
      end

      # find user using email
      def findByEmail(email)
          @user = User.find_by(email: email)
      end

      # update user password
      def updatePassword(user, password)
          @is_update_password = user.update_attribute(:password, password)
      end

  end
end
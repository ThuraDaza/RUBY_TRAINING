class UserService
  class << self
      # select all users
      def getAllUsers
          @users = UserRepository.getAllUsers
      end

      # create user
      def createUser(user)
          @is_user_create = UserRepository.createUser(user)
      end

      # select user using user id
      def getUserByID(id)
          @user = UserRepository.getUserByID(id)
      end

      # update user
      def updateUser(user, user_params)
          @is_user_update = UserRepository.updateUser(user, user_params)
      end

      # delete user
      def destroyUser(user)
          UserRepository.destroyUser(user)
      end
      
      # find user using email
      def findByEmail(email)
          @user = UserRepository.findByEmail(email)
      end

      # update user password
      def updatePassword(user, password)
          @is_update_password = UserRepository.updatePassword(user, password)
      end
  end
end
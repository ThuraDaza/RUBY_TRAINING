class UserService
  class << self
      # select all users
      def get_all_users
          @users = UserRepository.get_all_users
      end

      # create user
      def create_user(user)
          @is_user_create = UserRepository.create_user(user)
      end

      # select user using user id
      def get_user_by_id(id)
          @user = UserRepository.get_user_by_id(id)
      end

      # update user
      def update_user(user, user_params)
          @is_user_update = UserRepository.update_user(user, user_params)
      end

      # delete user
      def destroy_user(user)
          UserRepository.destroy_user(user)
      end
      
      # find user using email
      def find_by_email(email)
          @user = UserRepository.find_by_email(email)
      end

      # update user password
      def update_password(user, password)
          @is_update_password = UserRepository.update_password(user, password)
      end
  end
end
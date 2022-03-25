class UserService
  class << self
    # select all users
    def get_all_users
      @users = UserRepository.get_all_users
    end

    # create raw sql query
    def create_sql_string(name, email, user_type, phone, address, bday)
      temp = []
      temp.push({key: "name", value: name}) if name && name != ""
      temp.push({key: "email", value: email}) if email && email != ""
      temp.push({key: "super_user_flag", value: user_type}) if user_type && user_type != ""
      temp.push({key: "phone", value: phone}) if phone && phone != ""
      temp.push({key: "address", value: address}) if address && address != ""
      temp.push({key: "birthday", value: bday}) if bday && bday != ""

      @sql_str = ""

      temp.each do |item|
        @sql_str << " and " if @sql_str != ""

        if item[:key] == "super_user_flag"
          @sql_str << "#{item[:key]} = #{item[:value]}"
        else
          @sql_str << "#{item[:key]} = \"#{item[:value]}\""
        end
      end
      return @sql_str
    end

    # search user
    def search_user(sql_str)
      @users = UserRepository.search_user(sql_str)
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
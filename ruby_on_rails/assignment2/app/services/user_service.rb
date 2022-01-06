class UserService
  class << self
    # select all users
    def getAllUsers
      @users = UserRepository.getAllUsers
    end

    # create raw sql query
    def createSqlString(name, email, user_type, phone, address, bday)
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
    def searchUser(sql_str)
      @users = UserRepository.searchUser(sql_str)
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
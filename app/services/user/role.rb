class Role
  #to check if the user is valid for that particular action
  def self.verify (user,controller)
    case user.user_type
      when 'c'
        case controller
          when 'pooja'
          when 'order'
            return true
          else
            return false
        end
      when 'p'
        case controller
        when 'pandit'
        #when ''
          return true
        end
      else
        return false
    end
  end

end

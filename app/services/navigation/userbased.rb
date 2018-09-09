class Userbased

  def rootPath(user)
    case user.user_type
      when 'p' then
        pandits_path
      when 'c'
        poojas_path
        #when 'a'
      else
        'undefined'
    end
  end

end

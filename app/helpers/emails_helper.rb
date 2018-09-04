module EmailsHelper

  def is_email_verified(user)#check_if_verify_email(user)
    user.email_confirmed
  end

end

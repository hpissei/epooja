class EmailsController < ApplicationController


  def confirm_email_token
    user = User.find_by(email_confirm_token: params[:token])
    if user!=nil
      flash[:notice]="Email verified successfully"
      user.email_confirmed=true
      user.save
      redirect_to root_path
    else
      flash[:notice]="Something went wrong!"
    end
  end

end

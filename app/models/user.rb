class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :confirmation_token
  has_many :CustomerAddresses
  
  #private
  def confirmation_token
      if self.email_confirm_token.blank?
         self.email_confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end

end

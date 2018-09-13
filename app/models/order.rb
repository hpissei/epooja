class Order < ApplicationRecord
  belongs_to :pooja
  belongs_to :user
  has_many   :place_bids
  validates :Book_date, presence: true
  validates :Book_time, presence: true
  validates :pooja_id, presence: true

  scope :orders_by_user, -> (user_id){ where(user_id: user_id) }

end

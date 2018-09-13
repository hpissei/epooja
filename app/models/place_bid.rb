class PlaceBid < ApplicationRecord
  belongs_to :order
  scope :bids_by_user, -> (user_id){ where(user_id: user_id, bid_status: 'a') }#to consider if order is deleted first
end

class Order < ApplicationRecord
  validates :Book_date, presence: true
  validates :Book_time, presence: true
  validates :Pooja_id, presence: true
end

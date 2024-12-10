class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :guest
  validates :start_date, :end_date, :total_price, presence: true
end

class Host < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  has_many :flats
  has_many :bookings
end

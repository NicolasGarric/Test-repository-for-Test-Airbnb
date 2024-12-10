class Flat < ApplicationRecord
  belongs_to :host
  has_many :bookings, dependent: :destroy
  validates :price, :name, :description, :address, :max_guests, presence: true
end

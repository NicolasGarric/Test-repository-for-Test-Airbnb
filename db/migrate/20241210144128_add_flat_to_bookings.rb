class AddFlatToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :flat, null: false, foreign_key: true
  end
end

class AddAvailableToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :available, :boolean
  end
end

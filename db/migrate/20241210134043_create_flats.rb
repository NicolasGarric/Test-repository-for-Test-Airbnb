class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.float :price
      t.string :name
      t.string :description
      t.string :address
      t.integer :max_guests
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end

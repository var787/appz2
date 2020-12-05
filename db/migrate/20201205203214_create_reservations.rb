class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.string :status
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end

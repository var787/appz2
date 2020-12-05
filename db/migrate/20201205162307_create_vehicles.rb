class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle_type, null: false, foreign_key: true
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.integer :horsepower
      t.string :powertrain
      t.float :acceleration

      t.timestamps
    end
  end
end

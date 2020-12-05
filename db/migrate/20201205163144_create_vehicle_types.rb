class CreateVehicleTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_types do |t|
      t.string :name
      t.string :active

      t.timestamps
    end
  end
end

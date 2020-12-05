class AddPerHourPriceToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :per_hour_price, :integer
  end
end

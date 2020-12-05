class AddLocationAndDescriptionToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :location, :text
    add_column :vehicles, :description, :text
  end
end

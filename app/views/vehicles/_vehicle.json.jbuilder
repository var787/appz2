json.extract! vehicle, :id, :user_id, :vehicle_type_id, :year, :make, :model, :color, :horsepower, :powertrain, :acceleration, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)

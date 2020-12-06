VehicleType.delete_all
['Truck', 'Exotic', 'Vintage', 'Luxury', 'RV','Bike'].each do |ty|
    VehicleType.find_or_create_by(name: ty, active: true)
end

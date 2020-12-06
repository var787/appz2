VehicleType.delete_all
['Truck', 'Exotic', 'Vintage', 'Luxury', 'RV', 'SUV','Bike'].each do |ty|
    VehicleType.find_or_create_by(name: ty, active: true)
end

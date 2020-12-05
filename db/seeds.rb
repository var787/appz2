['Vans', 'Car', 'Classics', 'Exotic & luxury', 'Sport', 'SUVs'].each do |ty|
    VehicleType.find_or_create_by(name: ty)
end

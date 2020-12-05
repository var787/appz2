class VehicleType < ApplicationRecord
  has_many :vehicles
  scope :active, -> { where(active: true)}
end

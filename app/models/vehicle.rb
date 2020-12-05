class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_type
  has_many_attached :images

  has_many :reservations
end

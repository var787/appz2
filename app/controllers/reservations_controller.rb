class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: [:new, :create]

  def new
    session[:booking_attributes] = params[:reservation]
    @start_datetime = DateTime.parse(session[:booking_attributes][:start_date])
    @end_datetime = DateTime.parse(session[:booking_attributes][:end_date])
    @total_price = (@end_datetime- @start_datetime).to_i * @vehicle.per_hour_price.to_i
  end

  def create
    @reservation = @vehicle.reservations.new
  end

  def show
  end

  private
  def set_vehicle
    @vehicle = Vehicle.find(params[:reservation][:vehicle_id] || session[:booking_attributes][:vehicle_id])
  end
end
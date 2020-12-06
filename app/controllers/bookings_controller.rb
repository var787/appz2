class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:vehicle).order('created_at desc')
  end

  def cancel
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation
      @reservation.update(status: "cancel")
      redirect_to bookings_path
    end
  end
end
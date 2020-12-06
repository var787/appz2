class VehiclesController < ApplicationController
  before_action :authenticate_user!, except: [:search, :show]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = current_user.vehicles.all
  end

  def show
    @reservation = @vehicle.reservations.new
  end

  def new
    @vehicle = current_user.vehicles.new
  end

  def edit
  end

  def create
    @vehicle = current_user.vehicles.new(vehicle_params)

    respond_to do |format| #
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
      else
        format.html { render :new }
         #Respond to both HTML and Json requests. Status :http request status. If status not defined then default error would be 500.
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' } #format.html is to process HTML requests
    end
  end

  def search
    if params[:vehicle_type] == "all"
      @vehicles = Vehicle.where('lower(make) like (?) or lower(model) like (?) or lower(location) like (?)', "%#{params[:name].try(:downcase)}%", "%#{params[:name].try(:downcase)}%", "%#{params[:location].try(:downcase)}%")
    else
      # @vehicles = Vehicle.where(vehicle_type_id: VehicleType.where("name like ?", params[:vehicle_type]))
      @vehicles = Vehicle.joins(:vehicle_type).where("vehicle_types.name like ?", params[:vehicle_type])
      # select * from joins vehicle_type on vehicle_type.id = vehicle.vehicle_type_id where vehicle_type.name = params[:vehicle_type]
    end
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:user_id, :vehicle_type_id, :year, :make, :model, :color, :horsepower, :powertrain, :acceleration, :per_hour_price, :location, :description, images: [])
    end
end

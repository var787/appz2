class VehiclesController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = current_user.vehicles.all
  end

  def show
  end

  def new
    @vehicle = current_user.vehicles.new
  end

  def edit
  end

  def create
    @vehicle = current_user.vehicles.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    # @vehicles = Vehicle.where(vehicle_type_id: VehicleType.where("name like ?", params[:vehicle_type]))
    @vehicles = Vehicle.joins(:vehicle_type).where("vehicle_types.name like ?", params[:vehicle_type])
  end

  private
    def set_vehicle
      @vehicle = current_user.vehicles.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:user_id, :vehicle_type_id, :year, :make, :model, :color, :horsepower, :powertrain, :acceleration, :per_hour_price, :location, :description, images: [])
    end
end



class TripsController < ApplicationController

  def index
    @trips = Trip.order_by_recent
  end

  def new
    @trip = Trip.new
  end

  def create

    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.departure_date = Date.new trip_params["departure_date(1i)"].to_i, trip_params["departure_date(2i)"].to_i, trip_params["departure_date(3i)"].to_i
    @trip.save
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  def flights

  end

  private
  def trip_params
    params.require(:trip).permit(:user_id, :destination_id, :title, :description, :departure_date)
  end

end

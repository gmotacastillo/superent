class BookingsController < ApplicationController
  before_action :set_car, only: %i[new create]

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize(@booking)
    #working on this
    #sleep(10.seconds)
    #redirect_to users_dashboard_path
  end

  def new
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car_id = @car.id
    @booking.user = current_user
    authorize(@booking)
    if @booking.save
      flash[:notice] = "Booking was submitted!"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def change_status
    @booking = Booking.find(params[:id])
    authorize(@booking)
    @booking.update(status: params[:status].to_i) if params[:status].present?
    redirect_to users_dashboard_path
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    #The status does no make a lot of sense here?
    params.require(:booking).permit(:start_date, :end_date)
  end
end

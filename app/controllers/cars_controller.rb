class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car)
    @cars = @cars.where("location ILIKE ?", params[:location]) if params[:location].present?
    @cars = @cars.where("start_date <= ?", params[:start_date]) if params[:start_date].present?
    @cars = @cars.where("end_date >= ?", params[:end_date]) if params[:end_date].present?
  end

  def show
    @car = Car.find(params[:id])
    authorize(@car)
  end

  def new
    @car = Car.new
    authorize(@car)
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize(@car)
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    #here we need to complete this action !!!!!!!!!!
    #update
    authorize(@car)
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
    authorize(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
    authorize(@car)
  end

  private

  def car_params
    params.require(:car).permit(:model, :price, :start_date, :end_date, :description, :image_url, :photo, :location)
  end
end

class CarsController < ApplicationController
  def index
    @cars = Car.all
    @cars = @cars.where("location LIKE ?", "#{params[:location]}") if params[:location].present?
    @cars = @cars.where("start_date <= ?", params[:start_date]) if params[:start_date].present?
    @cars = @cars.where("end_date >= ?", params[:end_date]) if params[:end_date].present?
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  private

  def car_params
    params.require(:car).permit(:model, :price, :start_date, :end_date, :description, :image_url, :location)
  end
end

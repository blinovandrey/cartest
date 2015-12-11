class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def show
    redirect_to edit_car_path(@car)
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      check_and_add_photos(@car)
      redirect_to cars_path
    else
      render :new
    end
  end

  def update
    if @car.update_attributes(car_params)
      check_and_add_photos(@car)
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name, :gosnum, :pts, :pts_date, :photos)
    end

    def check_and_add_photos(car)
      if params[:images]
        params[:images].each { |image|
          if car.photos.create(image: image) && !car.has_photo?
            car.has_photo = true
            car.save
          end            
        }
      end
    end
end

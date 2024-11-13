class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show]

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all

  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end

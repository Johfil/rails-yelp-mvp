class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant ajouté avec succès.'
    else
      render :new
    end
  end

  def create_review
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review ajoutée avec succès.'
    else
      render :new_review
    end
  end

  def edit
    # Utilize @restaurant to pre-fill the edit form
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

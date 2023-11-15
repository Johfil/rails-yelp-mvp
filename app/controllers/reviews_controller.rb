class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review ajoutée avec succès.'
    else
      render 'restaurants/show'
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

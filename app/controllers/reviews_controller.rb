class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  before_action :set_review, only: [:destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # Connect the restaurant to the review
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant = @review.restaurant

    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end

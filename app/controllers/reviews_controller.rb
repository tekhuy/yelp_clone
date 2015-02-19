class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.has_reviewed?(@restaurant)
      error message
    else
      review = @restaurant.reviews.create(review_params)
      review.user = current_user
      review.save
      redirect_to restaurants_path
    end

  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end

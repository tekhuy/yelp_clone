class ReviewsController < ApplicationController
  
  include ReviewsHelper

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.has_reviewed?(@restaurant)
      flash[:notice] = 'You can only leave one review for a restaurant'
      redirect_to restaurants_path
    else
      @review = Review.new
    end
  end

  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to '/restaurants'
  end

end

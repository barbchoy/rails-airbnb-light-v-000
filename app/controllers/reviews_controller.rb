class ReviewsController < ApplicationController
  def show
  end

  def index
  end

  def new
    @review = Review.new
    @house = House.find_by_id(params[:house_id])
  end

  def create
    @review = Review.new(review_params)
    binding.pry
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private

  def review_params
    params.require(:review).permit(:cleanliness_rating, :location_rating, :value_rating, :comments, :user_id, :house_id)
  end
end

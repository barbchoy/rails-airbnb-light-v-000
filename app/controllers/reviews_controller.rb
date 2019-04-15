class ReviewsController < ApplicationController
  def show
  end

  def index
  end

  def new
    @review = Review.new
  end

  def create
    binding.pry
    @review = Review.new(review_params)

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
    params.require(:review).permit(:cleanliness_rating, :location_rating, :value_rating, :comments)
  end
end

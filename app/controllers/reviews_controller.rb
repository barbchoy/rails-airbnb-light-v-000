class ReviewsController < ApplicationController
  def show
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @review = Review.find_by(id: params[:id])
      if @review.nil?
        redirect_to user_reviews_path(@user), alert: "Review not found"
      end
    elsif params[:house_id]
      @house = House.find_by_id(params[:house_id])
      @review = Review.find_by(id: params[:id])
      if @review.nil?
        redirect_to house_reviews_path(@house), alert: "Review not found"
      end
    else
      @review = Review.find_by(id: params[:id])
    end
  end

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      @reviews = @user.reviews
    elsif params[:house_id]
      @house = House.find_by_id(params[:house_id])
      @reviews = @house.reviews
    else
      redirect_to root
    end
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
      @house = House.find_by_id(params[:review][:house_id])
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private

  def review_params
    params.require(:review).permit(:cleanliness_rating, :location_rating, :value_rating, :comments, :house_id, :user_id)
  end
end

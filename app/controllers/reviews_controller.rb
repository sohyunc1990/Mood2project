

class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review)
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
  end

  def delete
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:rating, :title, :comments, :attraction_id, :user_id)
  end

end

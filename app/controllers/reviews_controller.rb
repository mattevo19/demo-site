class ReviewsController < ApplicationController

  # needs testing

  def create
    @blog = Blog.find(params[:blog_id])
    @review = Review.new(review_params)
    @review.blog = @blog
    @review.user = current_user
    if @review.save
      flash[:success] = "Review successfully added"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "Something went wrong"
      render 'blog/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

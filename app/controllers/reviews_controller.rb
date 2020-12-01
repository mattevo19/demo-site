class ReviewsController < ApplicationController

  # needs testing

  def create
    @blog = Blog.find(params[:blog_id])
    @review = Review.new(params[:review])
    @review.blog = @blog
    @review.user = current_user
    if @review.save
      flash[:success] = "Object successfully created"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "Something went wrong"
      render 'blog/show'
    end
  end

  def review_params
    # need to change varible
    params.require(:review).permit(:variable)
  end

  
end

class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # need to fill in all the information

  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.save
      flash[:success] = "Blog successfully created"
      redirect_to @blog
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
    @review = Review.new
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update_attributes(blog_params)
        flash[:success] = "Blog was successfully updated"
        redirect_to @blog
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.photo.attached?
      @blog.photo.purge
    end
    if @blog.destroy
      flash[:success] = 'Blog was successfully deleted.'
      redirect_to blogs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to blogs_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :description, :photo)
  end
end

class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # need to fill in all the information

  def index
    @blogs = Blog.all
  end

  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
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
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update_attributes(params[:blog])
        flash[:success] = "Object was successfully updated"
        redirect_to @blog
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
end

class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:notice] = "The post is successfully created"
      redirect_to posts_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "The post is successfully updated"
      redirect_to posts_path
    else
      render 'update', status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:notice] = "The post is successfully deleted"
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find_by(id: params[:id])
    end
end

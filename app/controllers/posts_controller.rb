class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(15)
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: "The post has been approved!"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "Your post wsas created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post # pundit thing
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post deleted successfully!"
    else
      redirect_to posts_path, notice: "Failed deleting post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

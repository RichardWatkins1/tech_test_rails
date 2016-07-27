class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.first
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      UserNotifierMailer.sample_email(@user).deliver
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post deleted successfully."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, :comments)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to posts_path
    end
  end

end

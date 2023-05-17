class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_params, only: %i[create]

  def show
    @post = Post.includes(comments: :author).find_by(author_id: params[:user_id], id: params[:id])
    @comments = @post.comments.includes(:author)
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find_by(author_id: params[:user_id], id: params[:post_id])
    return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false if @post.nil?

    if @post.destroy
      redirect_to user_posts_path(current_user)
    else
      redirect_to user_post_path(current_user, @post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end

class PostsController < ApplicationController
  def show
    @post = Post.includes(comments: :author).find_by(params[id: :user_id])
    @comments = @post.comments.includes(:author)
  end

  def index
    @user = User.includes(:posts, posts: [:author, :comments, { comments: :author }]).find(params[:user_id])
    @posts = @user.posts
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

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end

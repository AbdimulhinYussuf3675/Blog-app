class PostsController < ApplicationController
  def show
    @post = Post.where(author_id: params[:user_id], id: params[:id]).first
  end

  def index
    @posts = Post.where(author_id: params[:user_id])
  end
end

class PostsController < ApplicationController
  def show
    @post = User.find(params[:id])
    @user = @post.autor
  end

  def index
    @users = User.all
  end
end

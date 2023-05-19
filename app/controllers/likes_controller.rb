class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author = current_user
    @like.post = Post.find(params[:post_id])
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end
end

class Api::V1::PostsController < ActionController::API
  load_and_authorize_resource

  def index
    @posts = User.find(params[:user_id]).posts
    render json: { success: true, data: { posts: @posts } }
  end
end

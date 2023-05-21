class Api::V1::CommentsController < ActionController::API
  load_and_authorize_resource

  def index
    @post = Post.find(params[:post_id])
    render json: { success: true, data: { comments: @post.comments } }
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, message: 'Post not found' }
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], author: post.author)

    if comment.save
      render json: { success: true, message: 'Comment created' }
    else
      render json: { success: false, message: 'Comment not created' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

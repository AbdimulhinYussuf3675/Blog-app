class Api::V1::UsersController < ActionController::API
  load_and_authorize_resource

  def index
    render json: { success: true, data: { users: User.all } }
  end

  def show
    render json: { success: true, data: { user: User.find(params[:id]) } }
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, message: 'User is not found' }
  end
end

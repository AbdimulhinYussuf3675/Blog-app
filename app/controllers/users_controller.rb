class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end

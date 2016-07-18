class UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def destroy
    User.destroy(params[:id])
    flash[:success] = 'User deleted'
    redirect_to root_path
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end

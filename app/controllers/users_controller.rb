class UsersController < ApplicationController
  def index
    @users = User.order("total_karma_points DESC").page(params[:page].to_i)
  end
end

class UsersController < ApplicationController
  def index
    @users = User.order("total_karma_points DESC").limit(50)
  end
end

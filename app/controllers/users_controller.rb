class UsersController < ApplicationController
  def index
    @page_num = params[:page].to_i
    if @page_num < 100

    end
    @users = User.order("total_karma_points DESC").page(params[:page].to_i)
  end
end

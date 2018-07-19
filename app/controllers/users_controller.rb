class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:user_id])
    if @user == current_user && !@user.nil?
    @assignment = Assignment.new

    redirect_to user_path(@user)
   end
  end

  def show_completed
    @users = User.all.order('id DESC')
    #@user = User.find(params[:id])
  end

end

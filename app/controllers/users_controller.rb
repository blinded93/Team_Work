class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    if @user.save

    redirect_to root_path
    else

    render :new
   end
 end#class

 def show
   @assignments = Assignment.all
 end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end#class

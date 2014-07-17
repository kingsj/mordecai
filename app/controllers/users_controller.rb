class UsersController < ApplicationController
	before_action :authenticate_user!

	def show 
	end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.role = 'admin'
    @user.save
    flash[:notice] = "Successfully gave #{@user.email} admin privileges."
    redirect_to users_path
  end
end
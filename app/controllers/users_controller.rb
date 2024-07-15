class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end
end

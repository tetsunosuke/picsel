class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def delete
    @user = User.find(params[:id])
  end
end

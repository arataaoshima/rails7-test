class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User is successfully created!"
      redirect_to users_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "User Info is successfully updated!"
      redirect_to users_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

class UsersController < ApplicationController
  http_basic_authenticate_with name: "user", password: "password", except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to users_path, alert: "Successfully Created"
    else
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])

    if @users.update(user_params)
      redirect_to users_path, alert: "Successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :image, :password, :passwod_confirmation)
  end
end


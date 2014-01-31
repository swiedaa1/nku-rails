class UserController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params).permit(:name, :nickname, :email, :image)
    if @user.save
    redirect_to user 
    else 
	render 'new'
    end
end
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @user = User.all
  end   
  
  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :image)
    end


end

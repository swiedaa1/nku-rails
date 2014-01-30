class UserController < ApplicationController
def show
 user = User.find(params[:id]
 @user = UserPresenter.new(user)
end
def show
 @user = current_user.find(params[:id])
end
def create
 post = Post.new(params)
 post.user = current_user
 post.save
	if @post.save
	 redirect_to posts_path, notice: "Success!"
	else
	 render :new
	end
end




end

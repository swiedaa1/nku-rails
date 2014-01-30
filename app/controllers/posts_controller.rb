class PostsController < ApplicationController

def new
  @post = Post.new
end
 
def create
  @post = Post.new(params[:post].permit(:name,:nickname,:email, :image, :text))
 
  if @post.save
    redirect_to @post, notice: "Success!" 
  else
    render 'new'
  end
end
def show
  user = User.find(params[:id])
  @user = UserPresenter.new(user)
end

def index
  @posts = Post.all
end

def edit
  @post = Post.find(params[:id])
end 

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:name,:nickname,:email,:image, :text) )
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end

private
  def post_params
    params.require(:post).permit(:name,:nickname,:email,:image, :text)
  end
end


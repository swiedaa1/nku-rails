class PostsController < ApplicationController

def new
  @post = Post.new
end
 
def create
  @post = Post.new(params[:user].permit(:name,:nickname,:email, :image, :text))
 
  if @post.save
    redirect_to @post, notice: "Success!" 
  else
    render 'new'
  end
end
def show
  @post = Post.find(params[:id])
  end

def index
  @posts = Post.all
end

def edit
  @post = Post.find(params[:id])
end 

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:user].permit(:name,:nickname,:email,:image, :text) )
    redirect_to @post
  else
    render 'edit'
  end
end

def create
if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
private
  def post_params
    params.require(:user).permit(:name,:nickname,:email,:image, :text)
  end
end


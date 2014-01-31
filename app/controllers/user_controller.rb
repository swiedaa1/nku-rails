class UserController < ApplicationController

def new                                                                                                                                                                                                        
  @post = User.new                                                                                                                                                                                             
end                                                                                                                                                                                                            
                                                                                                                                                                                                               
def create                                                                                                                                                                                                     
  @post = User.new(params[:post].permit(:name,:nickname,:email, :image, :text))                                                                                                                                
                                                                                                                                                                                                               
  if @post.save                                                                                                                                                                                                
    redirect_to @post, notice: "Success!"                                                                                                                                                                      
  else                                                                                                                                                                                                         
    render 'new'                                                                                                                                                                                               
  end                                                                                                                                                                                                          
end                                                                                                                                                                                                            
def show                                                                                                                                                                                                       
  @post = User.find(params[:id])                                                                                                                                                                               
  end                                                                                                                                                                                                          
                                                                                                                                                                                                               
def index                                                                                                                                                                                                      
  @posts = User.all                                                                                                                                                                                            
end                                                                                                                                                                                                            
                                                                                                                                                                                                               
def edit                                                                                                                                                                                                       
  @post = User.find(params[:id])                                                                                                                                                                               
end                                                                                                                                                                                                            
                                                                                                                                                                                                               
def update                                                                                                                                                                                                     
  @post = User.find(params[:id])                                                                                                                                                                               
                                                                                                                                                                                                               
  if @post.update(params[:post].permit(:name,:nickname,:email,:image, :text) )                                                                                                                                 
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
    params.require(:post).permit(:name,:nickname,:email,:image, :text)                                                                                                                                         
  end     
end

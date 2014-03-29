class AssignmentsController < ApplicationController
  before_action :is_admin, only: [:new, :create]
  delegate :name, :to => :user, :prefix => true
  
  def new
    @assignment = Assignments.new
  end
  
  def create
    if(current_user.is_admin)
      @assignment = Assignments.new
    
      @selected_user = User.find_by_name(params[:user_id])
    
      @assignment.user = @selected_user
      @assignment.name = params[:assignment][:name]
      @assignment.score = params[:assignment][:score]
      @assignment.total = params[:assignment][:total]
    else
      redirect_to users_path, :notice => "You are not authorized to view this page."
    end
      
    
    @assignment.save
    redirect_to users_path, :notice => "You have successfully created the assignment."
  end
  
  
  def show
    @assignments = Assignments.where("user_id = ?", params[:id])
  end
  
  def index
    if(params[:id] == nil)
      @assignments = Assignments.all
    else
      @assignments = Assignments.where("user_id = ?", params[:id])
    end      
  end  
end

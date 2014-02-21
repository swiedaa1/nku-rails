class AttendancesController < ApplicationController
    def new
    @attendance = Attendance.new
  end
  
  def create
    @current = current_user
    
    @attendance = Attendance.new
    @attendance.seat = params[:attendance][:seat]
    @attendance.attended_on = Time.now
    @attendance.user_id = @current.id
    
    @alreadyAttended = Attendance.where(:attended_on => Date.today,
      :user_id => @current.id)
    
    if(@alreadyAttended.first == nil)
      @attendance.save
      redirect_to attendances_path, :notice => "You have successfully logged your attendance."
    else
      flash[:error] = "You have already created an attendance for today."
      redirect_to users_path
    end
  end
  
  def show
    @attendance = Attendance.find(params[:id])
  end
  
  def index
    @attendances = Attendance.all
  end
end

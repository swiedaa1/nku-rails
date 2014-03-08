class AttendancesController < ApplicationController
    def new
    @attendance = Attendance.new
  end
  
  def create
    @current = current_user
    
    @attendance = Attendance.new
    @attendance.seat = params[:attendance][:seat]
    @attendance.attended_on = Time.zone.now #Fix UTC default time issue
    @attendance.user_id = @current.id
    
    @alreadyAttended = Attendance.where( :attended_on => Time.zone.today,
      :user_id => @current.id )
    
    if( @alreadyAttended.first == nil )
      @attendance.save
      redirect_to root_path, :notice => "You have successfully logged your attendance."
    else
      flash[:error] = "You have already created an attendance for today."
      redirect_to attendances_path
    end
  end
  
  def show
    @attendances = Attendance.where("user_id = ?", params[:id])
  end
  
  def index
    if(params[:id] == nil)
      @attendances = Attendance.all
    else
      @attendances = Attendance.find(params[:id])
    end      
  end
  
  private
  def attendance_params
    current = get_current_user
    params[:attendance][:user_id] = current.id
    params[:attendance][:attended_on] = Time.zone.today
    params.require(:attendance).permit(:seat, :user_id, :attended_on, :nickname)
  end
end

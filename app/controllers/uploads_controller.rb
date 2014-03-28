class UploadsController < ApplicationController
  before_action :is_admin
  
  def index
  end

  def create
    require 'csv'
    
    if(params[:file] == nil)
      flash[:error] = "Invalid file or no file selected"
      redirect_to uploads_path
    else    
      @upload = params[:file]
      @assignments_created = Assignments.import(@upload)
      redirect_to assignments_path, :notice => @assignments_created.to_s + " assignments were created"
    end
   end
end

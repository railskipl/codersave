class CoursesController < ApplicationController
  
  layout "dashboard"
  def show
   @course = Course.find(params[:id])  
  end
    
  
end

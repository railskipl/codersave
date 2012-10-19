class CoursesController < ApplicationController
     before_filter :authenticate, :only => [:edit, :update, :dashboard,:show]
     
  layout "dashboard"
  
  def show
   @course = Course.find(params[:id])  
  end
  
  
  def rate
    @course = Course.find(params[:id])
    @course.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @course.wrapper_dom_id(params), ratings_for(@course, params.merge(:wrap => false))
      page.visual_effect :highlight, @course.wrapper_dom_id(params)
    end
  end
   
   
  private
    def authenticate
      deny_access unless signed_in?
    end 
    
  
end

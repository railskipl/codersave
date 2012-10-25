class CoursesController < ApplicationController
     before_filter :authenticate, :only => [:edit, :update, :dashboard,:show]
     
  layout "courses"
  
  def show
   @course = Course.find(params[:id])  
   
   @comment =  @course.comments.new
    
    #calculate discount
   
     @calculate_discount = ((@course.percent_off|| 1)/100)*((@course.price))
     
     @total_discount = (@course.price)-(@calculate_discount) 
   
   
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

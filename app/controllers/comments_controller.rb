class CommentsController < InheritedResources::Base
  
  def create
    
    @comment = Comment.new(params[:comment])
      
      if @comment.save
         flash[:notice] = "Successfully comment added."
          redirect_to course_path(@comment.course_id)
      else
        render :action => 'new'
    end
    
    
  end
  
end

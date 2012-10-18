class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  layout :layout_by_resource
  
  def layout_by_resource
    if signed_in?
      "dashborad"   
    else
      "application"
    end
  end

end

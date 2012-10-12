class HomesController < ApplicationController

  def index
    if signed_in?
      redirect_to user_root_path
    else
     
    end
  end
  
end

class SessionsController < ApplicationController
  def new
    @title="Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    elsif user.authenticated_via_link
      user_sign_in user
      redirect_to user_root_path
    else
       flash.now[:error] = "Please authenticate your email with verification link."
       puts "Please authenticate your email with verification link."
       @title = "Sign in"
       render 'new'
    end
  end
 
  def destroy
    user_sign_out
    redirect_to root_path
  end

end

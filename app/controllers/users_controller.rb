class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :my_profile, :dashboard]
  before_filter :correct_user, :only => [:edit, :update]
  layout 'dashboard'
  def show
    @user = User.find(params[:id])
   
  end
  def rate
    @course = Course.all
    @course.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @course.wrapper_dom_id(params), ratings_for(@course, params.merge(:wrap => false))
      page.visual_effect :highlight, @course.wrapper_dom_id(params)
  end
 end
 
 
 
  def new
    @user = User.new
    @title="Sign up"
  end
 
  def dashboard
    @users = User.all
    @course = Course.all
    
    if !params[:value].nil?
      @courses = Course.find_all_by_course_category(params[:value])
    else
      @courses = Course.find(:all,:order => "is_featured DESC")
    end 
    
    
    #calculate discount
  
   
    
    
  end
  def my_profile
   
  end
  def account_setting
   
  end
  def about_us
   
  end
  def help
   
  end
  def how_it_works
   
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save && UserMailer.authenticate_registration(@user).deliver 
      redirect_to root_url, notice: "Please check your email for verification link #{@user.email}"
      
    else
      @title = "Sign up"
      render 'new'
    end
 
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if (User.authenticate(@user.email, params[:user][:password]) == @user) || (@user.authentications && (@user.encrypted_password == nil))
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated Successfully."
        redirect_to users_my_profile_path
      else
        @title = "Edit user"
        render 'edit'
      end 
    else
      flash[:error] = "Profile not updated. Enter Correct Password"
      render 'edit'
    end 
  end
  
  
  def check_email
      @user = User.find_by_email(params[:user][:email]) 
        respond_to do |format|
            format.json { render :json => !@user }
       end
  end
 
  def change_password
    @user = User.find(current_user.id)
    if request.post?
      if (User.authenticate(@user.email, params[:change_password][:old_password]) == @user) || (@user.authentications && (@user.encrypted_password == nil))
        @user.password = params[:change_password][:new_password]
        @user.password_confirmation =
        params[:change_password][:new_password_confirmation]

        if @user.save
          flash[:notice] = 'Password successfully updated!'
          redirect_to @user
        else
          flash[:error] = 'New password mismatch.'
          render :action => 'change_password'
        end
      
      else
          flash[:error] = 'Old password incorrect.'
          render :action => 'change_password'
      end
    end
  end
 
  def is_authenticated
    @user =  User.find_by_id(params[:id])
    @user.update_column(:is_authenticated, true)
    redirect_to root_path, :flash => {:success => "Congratulations Profile verified! Please login."}
  end
  
  
    
  private
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user=(@user)
  end

  
end

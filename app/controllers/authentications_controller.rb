class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = Authentication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
    @authentication = Authentication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/new
  # GET /authentications/new.json
  def new
    @authentication = Authentication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/1/edit
  def edit
    @authentication = Authentication.find(params[:id])
  end

  # POST /authentications
  # POST /authentications.json
  def create
    auth = request.env["omniauth.auth"]
    # Try to find authentication first
      authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
      if authentication
         # Authentication found, sign the user in.
         flash[:notice] = "Signed in successfully."
         sign_in(authentication.user)
         redirect_to user_root_path
      else
         # Authentication not found, thus a new user.
         user = User.new
         # Apply Omniauth method in user for new omniauth account!
         user.apply_omniauth(auth)
         if user.save(:validate => false)
           flash[:notice] = "Account created and signed in successfully."
           sign_in user
           redirect_to user_root_path
         else
           flash[:error] = "Error while creating a user account. Please try again."
           redirect_to root_url
         end
      end
  end

  # PUT /authentications/1
  # PUT /authentications/1.json
  def update
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      if @authentication.update_attributes(params[:authentication])
        format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to authentications_url }
      format.json { head :no_content }
    end
  end
end

class SessionsController < ApplicationController
  def new
  end

	def auth_failure
	  # redirect_to root_path
	end

 def create

 	@user = User.from_omniauth(request.env['omniauth.auth'])
    if @user
      log_in @user
      remember(@user)
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to @user
    else
      flash[:warning] = "There was an error while trying to authenticate you..."
      redirect_to root_path
    end

 end

 def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

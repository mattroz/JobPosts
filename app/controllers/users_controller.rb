class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    begin
    @auth = request.env['omniauth.auth']['credentials']
    # @user = User.from_omniauth(request.env['omniauth.auth'])
    # session[:user_id] = @user.id
    Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      expires_at: Time.at(@auth['expires_at']).to_datetime)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    rescue
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

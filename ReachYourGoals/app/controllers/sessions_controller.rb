class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])

    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  private
    def session_params
      params.require(:session).permit(:username,:password,:session_token)
    end

end

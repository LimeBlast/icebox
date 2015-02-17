class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to dashboard_path, notice: 'Welcome! You have logged in successfully.'
    else
      flash.now[:alert] = 'Login failed, please try again'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end

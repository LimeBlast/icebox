class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Something went wrong, please try again'
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  def new
    @register_user_form = RegisterUserForm.new
  end

  def create
    @register_user_form = RegisterUserForm.run(params[:register_user])
    if @register_user_form.valid?
      auto_login(@register_user_form.result)
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Something went wrong, please try again.'
      render :new
    end
  end
end

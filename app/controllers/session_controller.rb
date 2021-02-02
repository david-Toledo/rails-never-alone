class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by email:params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid email, username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil #this logs out out the user
    redirect_to login_path #go back to the login page
  end

end

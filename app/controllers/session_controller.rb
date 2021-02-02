class SessionController < ApplicationController
  def new
  end
  #
  # def create
  #   user = User.find_by email:params[:email]
  #   if user.present? && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path
  #   else
  #     flash[:error] = "Invalid email, username or password"
  #     redirect_to login_path
  #   end
  # end
  #
  # def destroy
  #   session[:user_id] = nil #this logs out out the user
  #   redirect_to login_path #go back to the login page
  # end

  def create
    user = User.find_by email: params[:email]

    respond_to do |format|
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id

        format.html { redirect_to root_path}
        format.json { render json: { user: user, logged_in: true }}
      else
        flash[:error] = 'Invalid Email or Password.'
        format.html { redirect_to login_path }
        format.json { render json: { status: 401, errors: 'Invalid Email or Password.' }}

      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to login_path }
      format.json { render json: { logged_in:false } }
    end

  end

  def is_logged_in

    if !!session[:user_id] && @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

end

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include Knock::Authenticable
  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id:session[:user_id]
    end

    session[:user_id] = nil unless @current_user.present?
  end


  def check_if_logged_in
    unless @current_user.present?
      flash[:error] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
  end



end

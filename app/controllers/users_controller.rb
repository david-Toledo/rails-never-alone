class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # before_action :authenticate_user

  def current
    render json: current_user
  end
  # GET /users or /users.json
  # def index
  #   @users = User.all
  # end
  def search

  end

  # geocode
  def index
    if params[:search].present?
      @users = User.near(params[:search], 5, :order => :distance)
    else
      @users = User.all
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if params[:user][:image].present?
        response = Cloudinary::Uploader.upload params[:user][:image]
        p response
        @user.image = response["public_id"]
    end
      # @user.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update

    if params[:user][:image].present?
        response = Cloudinary::Uploader.upload params[:user][:image]
        p response
        @user.image = response["public_id"]
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :image, :address, :longitude, :latitude, :admin, :user_active, :user_type, :police_check, :national_id, :covid_safe_certifcate, :about)
    end
end

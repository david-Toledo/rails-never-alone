class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show edit update destroy ]
  # before_action :check_if_logged_in
  # GET /responses or /responses.json
  before_action :authenticate_user, only: [:edit, :update]

  def index
    @responses = Response.all
  end

  # GET /responses/1 or /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses or /responses.json
  def create
    @response = Response.new(
      body: params[:body],
      post_id: params[:post_id],
      user_id:current_user.id
    )

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: "Response was successfully created." }
        format.json do
          render json: @response,
            include: {
              user:{only:[:id, :name, :about, :address, :longitude, :latitude]}
          }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1 or /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: "Response was successfully updated." }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1 or /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: "Response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.require(:response).permit(:body, :post_id, :user_id)
    end
end

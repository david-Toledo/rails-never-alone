class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # before_action :authenticate_user
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: [:edit, :update, :create]

  def current
    render json: current_user
  end

  # GET /posts or /posts.json
  def index

    @posts = Post.all

    render json: @posts,
    methods: [:created_at_formatted],
    include: {
      responses:{},
      user:{only:[:id, :name, :about, :address, :longitude, :latitude]}
    }
      # include:['responses']
      # ['responses', 'user']

  end

  # GET /posts/1 or /posts/1.json
  def show
    # headers['Access-Control-Allow-Origin'] = '*'
    post = Post.find params[:id]
    render json: post,
    methods: [:created_at_formatted],
    include: {
      responses:{include:{user:{only:[:id, :name, :about, :address, :longitude, :latitude]}}},
      user:{only:[:id, :name, :about, :address, :longitude, :latitude]}
    }

    # ['responses']

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # post = Post.create(
    #   title:params[:title],
    #   location:params[:location],
    #   body:params[:body],
    #   user_id:params[:user_id]
    # )
    # render json: post

    @post = Post.new(
      title: params[:title],
      body: params[:body],
      user_id: current_user.id
    )

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json do
          render json: @post,
          methods: [:created_at_formatted],
          include: {
            responses: {},
            user:{
              only:[:id, :name, :about, :address, :longitude, :latitude]
            }
          }
        end
        # format.json { render :show, status: :created, location: @post}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :location, :body, :user_id)
    end
end

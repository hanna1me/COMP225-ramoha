class PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    sort_option = params[:sort]
    # @posts = Post.all
    @posts = case sort_option
    when "event_date"
      Post.order(event_date: :asc)
    when "date_posted"
      Post.order(updated_at: :desc)
    else
      Post.order(updated_at: :desc)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit 
    if @post.organizer != current_user
      redirect_to @post, notice: "You do not have permission to edit this post." #I'd like this to be red or something bc it is kind of a warning
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.organizer = current_user

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated.", status: :see_other 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.organizer != current_user
      redirect_to @post, notice: "You're not allowed to destroy other people's posts!" #I'd like this to be red or something bc it is kind of a warning
    else
      @post.destroy!
      redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(:event_title, :location, :event_date, :description)
    end
end

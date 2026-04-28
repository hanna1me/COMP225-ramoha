class PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    sort_orders = {
      "date_posted" => { updated_at: :desc },
      "event_date" => { event_date: :asc }
    }
    sort_order_name = params[:sort] || "date_posted"
    sort_order = sort_orders[sort_order_name]

    @posts = Post.includes(:interestedevents).order(sort_order)
    @upcoming = @posts.where("event_date >= ?", Date.current)
    @past = @posts.where("event_date < ?", Date.current)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.requirements.build
  end

  # GET /posts/1/edit
  def edit
    if @post.organizer != current_user
      redirect_to @post, alert: "You do not have permission to edit this post."
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
      redirect_to @post, alert: "You're not allowed to destroy other people's posts!"
    else
      # https://stackoverflow.com/questions/16945958/proper-way-to-delete-has-many-through-join-records
      Requirement.where(id: @post.requirements).delete_all
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
      params.fetch(:post, {}).permit(:event_title, :location, :event_date, :description, requirements_attributes: [ :id, :req_description, :_destroy ])
    end
end

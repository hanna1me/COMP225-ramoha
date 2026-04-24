class InterestedeventsController < ApplicationController
  before_action :find_post, only: [ :create, :destroy ]
  def create
    interested = current_user.interestedevents.new(post_id: @post.id)

    if interested.save
      flash[:notice] = "Marked as interested!"
    else
      flash[:alert] = "Interest failed to save."
    end

    redirect_to @post
  end

  def destroy
     interested = current_user.interestedevents.find(params[:id])

     if interested.destroy
       flash[:notice] = "Post has been removed from your interested events."
     else
       flash[:alert] = "Removing interest failed."
     end
       redirect_to @post
  end

  def index
    # interested as default
    @tab = params[:tab] || "interested"

    sort_options = {
      "event_date" => { event_date: :asc },
      "date_posted" => { updated_at: :desc }
    }
    order = sort_options[params[:sort]] || { updated_at: :desc }

    if @tab == "created"
      @events = current_user.organizedevents.order(order)
    else
      @events = current_user.posts.order(order)
    end
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end

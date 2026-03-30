class SessionsController < ApplicationController
  layout "auth"
  def new
  end

  def create
    user = User.find_by(username: params[:username].downcase.strip)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:alert] = "Invalid username or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "You have been signed out."
  end
end

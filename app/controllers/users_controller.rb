class UsersController < ApplicationController
  layout "auth", only: [ :new, :create ]
  before_action :require_login, only: [ :edit, :update ]
  helper_method :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.username = @user.username.downcase.strip if @user.username.present?
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Welcome, #{@user.username}!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    permitted = settings_params
    permitted[:username] = permitted[:username].downcase.strip if permitted[:username].present?
    notice = permitted.key?(:username) ? "Username updated!" : "Profile picture updated!"
    if @user.update(permitted)
      redirect_to settings_path, notice: "Successfully saved changes!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def user_params
    params.expect(user: [ :username, :password, :password_confirmation, :avatar ])
  end

  def settings_params
    params.expect(user: [ :avatar, :username ])
  end
end

class UsersController < ApplicationController
  layout "auth"
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

  private

  def user_params
    params.expect(user: [ :username, :password, :password_confirmation, :avatar ])
  end
end

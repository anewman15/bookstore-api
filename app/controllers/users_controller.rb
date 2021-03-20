class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(user_create_params)

    if @user.save
      render json: @user, status: :ok
    elsif User.exists?(username: @user.username) || User.exists?(email: @user.email)
      render json: { message: 'User exists already' }
    elsif @user.password != @user.password_confirmation
      render json: { message: 'Passwords mismatch' }
    else
      render json: { message: 'User not created' }, status: :unprocessable_entity
    end
  end

  private

  def user_create_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

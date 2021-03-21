class User::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.find_by(username: sign_in_params[:username])

    if @user&.valid_password?(sign_in_params[:password])
      render json: @user, status: :created
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # private

  def sign_in_params
    params.require(:user).permit(:username, :password)
  end
end

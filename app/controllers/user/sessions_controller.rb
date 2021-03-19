# frozen_string_literal: true

class User::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.find_by(username: params[:username])

    if @user&.valid_password?(params[:password])
      render json: @user, status: :created
    else
      render json: { message: 'Invalid credentials'}, status: :unauthorized
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  # def sign_in_params
  #   params.require(:user).permit(:username, :password)
  # end

  protected

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end

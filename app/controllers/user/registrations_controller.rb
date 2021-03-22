class User::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, except: [:new]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
end

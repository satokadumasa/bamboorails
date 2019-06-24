# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :befor_logout, only: [:destroy]
  after_action :after_login, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end

    def after_login
      unless current_user.first_sign_in_at
        current_user.first_sign_in_at = Time.current
        current_user.save
      end
      current_user.sign_in_count = current_user.sign_in_count + 1
      current_user.current_sign_in_at = Time.current
      current_user.current_sign_in_ip = request.remote_ip
      current_user.save
    end

    def befor_logout
      current_user.last_sign_in_at = current_user.current_sign_in_at
      current_user.save
    end
end

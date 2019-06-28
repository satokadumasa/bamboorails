# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    super
  end

  # POST /resource/confirmation
  def create
    super
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    user = User.where(confirmation_token: params['confirmation_token']).first()
    user_info = UserInfo.create({
      user_id: user.id,
      name:  'User-' + user.id.to_s,
      mobile: '00000000000',
      pref_id: 1,
      postal_code: '000-0000',
      address: 'Any Where',
      user_name: 'User-' + user.id.to_s
    })
    # super
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    logger.debug("Users::ConfirmationsController.after_resending_confirmation_instructions_path_for")
    super(resource_name)
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    logger.debug("Users::ConfirmationsController.after_confirmation_path_for")
    super(resource_name, resource)
  end
end

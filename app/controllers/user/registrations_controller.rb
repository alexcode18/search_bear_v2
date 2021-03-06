class User::RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]

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

  # protected

  # You can put the params you want to permit in the empty array.
  # def sign_up_params
  #   allow = [:email, :password, :password_confirmation, :bear_id]
  #   params.require(resource_name).permit(allow)
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)

    if resource.bear_id === undefined || resource.bear_id === nil do
      @new_bear = Bear.new()
      @new_bear.name = Faker::Name.first_name()
      @new_bear.gender = ["M", "F"].sample
      @new_bear.hunger = 100
      @new_bear.happiness = 100
      @new_bear.energy = 100
      @new_bear.user_id = resource.id

      resource.bear_id = @new_bear.id
      resource.save()
      @new_bear.save()
    end
    respond_with resource, signed_in_root_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

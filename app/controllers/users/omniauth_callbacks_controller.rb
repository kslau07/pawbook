# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def provider_callback(provider_name)
    # TODO: Should this be @user?
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: provider_name.capitalize
      sign_in_and_redirect user, event: :authentication

      # sign_in_and_redirect user, event: :authentication
      # set_flash_message(:notice, :success, kind: provider_name.capitalize) if is_navigational_format?
    else
      session["devise.#{provider_name}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def facebook
    provider_callback('facebook')

    # TODO: delete me if unused
    # @user = User.from_omniauth(request.env['omniauth.auth'])
    #
    # if @user.persisted?
    #   sign_in_and_redirect @user, event: :authentication
    #   set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    # else
    #   session['devise.facebook_data'] = request.env['omniauth.auth']
    #   redirect_to new_user_registration_url
    # end
  end

  def google_oauth2
    provider_callback('google')
  end

  # def github
  #   provider_callback('github')
  # end

  def github
    user = User.from_omniauth(auth) # new user is created here

    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'GitHub'
      sign_in_and_redirect user, event: :authentication
    else # if user not found
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure', kind: 'GitHub', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # TODO: delete me if unused
  def auth
    @auth = request.env['omniauth.auth']
  end
end

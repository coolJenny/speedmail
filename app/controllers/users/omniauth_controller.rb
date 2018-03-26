class Users::OmniauthController < Devise::OmniauthCallbacksController
	# facebook callback
	# def facebook
	# 	@user = User.create_from_provider_data(request.env['omniauth.auth'])
	# 	if @user.persisted?
	# 		sign_in_and_redirect @user
	# 		set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
	# 	else
	# 		flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
	# 		redirect_to new_user_registration_url
	# 	end 
	# end

	# # github callback
	# def github
	# 	@user = User.create_from_provider_data(request.env['omniauth.auth'])
	# 	if @user.persisted?
	# 		sign_in_and_redirect @user
	# 		set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
	# 	else
	# 		flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
	# 		redirect_to new_user_registration_url
	# 	end
	# end

	# # google callback
	# def google_oauth2
	# 	@user = User.create_from_provider_data(request.env['omniauth.auth'])
	# 	if @user.persisted?
	# 		sign_in_and_redirect @user
	# 		set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
	# 	else
	# 		flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
	# 		redirect_to new_user_registration_url
	# 	end 
	# end

	# # twitter callback
	# def twitter
	# 	@user = User.create_from_provider_data(request.env['omniauth.auth'])
	# 	if @user.persisted?
	# 		sign_in_and_redirect @user
	# 		set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
	# 	else
	# 		flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
	# 		redirect_to new_user_registration_url
	# 	end 
	# end

	# def failure
	# 	flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
	# 	redirect_to new_user_registration_url
	# end


	def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:twitter, :facebook, :facebook, :google].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end

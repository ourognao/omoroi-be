Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email', info_fields: 'email,name'
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], {
  	#strategy_class: OmniAuth::Strategies::Facebook,
  	scope: 'email',
  	info_fields: 'email,name',
  	callback_path: '/auth/facebook/callback',
  	# callback_path: 'https://omoroi-fe-staging.herokuapp.com/auth/facebook/callback',
  	# callback_path: '/auth/facebook/callback',
  	# http://www.mysite.com/users/auth/facebook/callback
  	provider_ignores_state: true
  	#token_params: { parse: :json }
  	# client_options: {
   #    site: 'https://graph.facebook.com/v3.1',
   #    authorize_url: "https://www.facebook.com/v3.1/dialog/oauth"
   #  }
  }
end

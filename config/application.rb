require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module OmoroiBe
  class Application < Rails::Application
    config.load_defaults 5.1
    
    config.time_zone = 'Tokyo'
    
    config.api_only = true

    config.eager_load_paths += Dir["#{config.root}/lib/**/"]

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose:  ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: :any
      end
    end
  end
end

module Overrides
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

    def omniauth_success
      get_resource_from_auth_hash
    end

    protected

    def get_resource_from_auth_hash
	  Rails.logger.info "BAGO :: {auth_hash['uid']}"
	end
  end
end

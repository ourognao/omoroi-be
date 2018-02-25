module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    prepend_after_action :debug, if: proc { Rails.env.development? && params[:debug] }

    def create
      super do |resource|
        if resource.status.inactive?
          render_create_error_inactive
          return
        end
      end
    end

    private

    def render_create_error_inactive
      render json: {
        errors: [I18n.t('devise_token_auth.sessions.inactive')]
      }, status: 401
    end

    def debug
      response.headers.merge!(@resource.debug) if @resource.present?
    end
  end
end

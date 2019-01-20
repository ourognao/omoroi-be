Devise.setup do |config|
  config.mailer_sender = Settings.mailer.gmail_no_reply
end

Rails.application.config.to_prepare do
  Devise::OmniauthCallbacksController.class_eval do
    def failure
      render json: { message: "Login failed." }, status: 401
    end
  end
end

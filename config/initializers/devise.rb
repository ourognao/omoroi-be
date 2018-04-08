Devise.setup do |config|
  config.mailer_sender = Settings.mailer.gmail_no_reply
end

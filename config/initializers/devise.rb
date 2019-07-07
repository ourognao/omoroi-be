Devise.setup do |config|
  config.mailer_sender = Settings.mailer.gmail_no_reply
  config.timeout_in = 1.day
end

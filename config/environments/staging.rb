Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.read_encrypted_secrets = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.log_level = :info

  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  ##############################
  ##### Mail settings
  ##############################
  config.action_mailer.default_url_options   = { host: "https://#{Settings.staging.api_host}" }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries    = true
  config.action_mailer.default_options       = { from: "#{ Settings.company.omoroi.name } <#{ ENV['GMAIL_USERNAME'] }>" }
  config.action_mailer.delivery_method       = :smtp

  ActionMailer::Base.smtp_settings = {
    :address              => Settings.mailer.gmail_smtp,
    :port                 => Settings.mailer.gmail_port,
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PASSWORD'],
    :authentication       => :plain,
    :enable_starttls_auto => true
  }
end

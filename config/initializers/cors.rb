Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Settings.development.app_host,
            Settings.staging.app_host,
            Settings.production.app_host
    resource '*',
      headers: :any,
      expose:  ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: :any
  end
end

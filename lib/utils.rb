module Utils

  RELEASE_EMAILS_CHANNEL = {
    name: '#release-emails',
    url: 'https://hooks.slack.com/services/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'
  }

  class << self

    def slack(to:, message:)
      channel = self.const_get("#{to}_CHANNEL".upcase)
      payload = {
        channel:    channel[:name],
        username:   'PMS4',
        text:       CGI.escape(message),
        mrkdwn:     true,
        link_names: 1
      }

      if Rails.env.production?
        request_post(channel[:url], payload)
      else
        # puts payload
        request_post(channel[:url], payload)
      end
    end

    def request_post(url, payload)
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(url)
      request.body = "payload=#{payload.to_json}"
      http.request(request)
    end
  end
end

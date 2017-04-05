Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['CONSUMER_KEY'].blank? || ENV['CONSUMER_SECRET'].blank?
    warn 'Command: CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server'
  else
    provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  end
end

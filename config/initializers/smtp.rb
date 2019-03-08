ActionMailer::Base.smtp_settings = {
  api_token: ENV['POSTMARK_API_KEY'],
  domain: 'kickmybets.fun',
  address: 'smtp.postmark.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
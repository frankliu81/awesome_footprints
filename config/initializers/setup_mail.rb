ActionMailer::Base.smtp_settings = {
  address:              "smtp.sendgrid.com",
  port:                 "587",
  enable_starttls_auto: true,
  authentication:       :login,
  user_name:            ENV["SENDGRID_USERNAME"],
  password:             ENV["SENDGRID_PASSWORD"]
}

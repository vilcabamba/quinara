# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Quinara::Application.initialize!

Rails.application.routes.default_url_options[:host] = 'fte.herokuapp.com'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'fte.heroku.com',
  :enable_starttls_auto => true
}

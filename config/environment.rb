# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Quinara::Application.initialize!

Rails.application.routes.default_url_options[:host] = 'fte.herokuapp.com'
# Load the Rails application.
MyApp::Application.initialize!

# Set the default host and port to be the same as Action Mailer.
MyApp::Application.default_url_options = MyApp::Application.config.action_mailer.default_url_options
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

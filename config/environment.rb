# Load the Rails application.
require_relative "application"
config.action_mailer.default_url_options = { host: 'localhost:3000' }
config.action_mailer.delivery_method = :letter_opener_web
# Initialize the Rails application.
Rails.application.initialize!

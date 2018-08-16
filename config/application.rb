require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PoojaApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    #heroku deployment
    config.assets.initialize_on_precompile = false
    config.secret_key = '348221b2a39149058952adc85064b034afe50997bae76fae795c4c065e4ef4bbf0907502c6ae47a4629090936510b7760b97aaa18371f40bda627e47b52315de'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

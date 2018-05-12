require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MusicApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_spec: false,
        helper_spec: false,
        routing_specs: false,
        controller_specs: true,
        request_spec: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end

<<<<<<< HEAD
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
=======
require_relative "boot"

require "rails"
>>>>>>> 87bdd57... Add rubocop
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
<<<<<<< HEAD
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
=======
>>>>>>> 87bdd57... Add rubocop
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    config.load_defaults 5.2
<<<<<<< HEAD

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
=======
>>>>>>> 87bdd57... Add rubocop
    config.generators.system_tests = nil
  end
end

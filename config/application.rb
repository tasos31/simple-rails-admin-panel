require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleRailsAdminPanel
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    config.time_zone = 'Berlin'
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    Date::DATE_FORMATS[:default] = "%e %b %Y"
    Time::DATE_FORMATS[:default] = "%H:%M"
    DEFAULT_DATETIME_FORMAT = "%e %b %Y %H:%M"
    class DateTime
      def to_s
        strftime DEFAULT_DATETIME_FORMAT
      end
    end
  end
end

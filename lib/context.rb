# This file kicks off the entire Context Engine
# 
require 'context/helpers'

module Context
  class Engine < Rails::Engine
    config.action_view.stylesheet_expansions[:defaults] = ['reset', 'ui.layout']
    config.action_view.javascript_expansions[:defaults] = ['jquery', 'rails']
    config.time_zone = 'UTC'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/vendor/plugins)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery rails)


    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    #config.filter_parameters += [:password]

    initializer 'context.helper' do |app|
      ActionView::Base.send :include, Context::ContextHelper
    end

    #initializer 'context.controller' do |app|
    #  ActiveSupport.on_load(:action_controller) do
    #    include MyEngineActionControllerExtension  
    #  end
    #end
  end
end

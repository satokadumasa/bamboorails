Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  config.dependency_loading = true
  config.require_master_key = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = Uglifier.new(harmony: true)
  config.assets.compile = true
  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.active_support.deprecation = :notify
  config.action_cable.url = 'ws://127.0.0.1:3000/cable'
  config.action_cable.allowed_request_origins = [ 'https://' + ENV['BAMBOO_HOST'], /https:\/\/www.hesper.*/ ]
  #config.web_console.whitelisted_ips = '127.0.0.1'
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: ENV['BAMBOO_HOST'], :protocol => 'https' }
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => ENV['BAMBOO_MAIL_SERVER'],
    :port => 587,
    :domain => ENV['BAMBOO_MAIL_DOMAIN'],
    :user_name => ENV['BAMBOO_MAIL_USER'],
    :password => ENV['BAMBOO_MAIL_PASSWORD'],
    :authentication => ENV['BAMBOO_MAIL_AUTH'],
  }
end

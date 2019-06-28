Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.perform_caching = false
  config.log_formatter = ::Logger::Formatter.new
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true
  config.action_cable.url = 'ws://' + ENV['BAMBOO_HOST'] + ':3000/cable'
  # config.action_cable.allowed_request_origins = [ 'http://' + ENV['BAMBOO_HOST'] , /http:\/\/hesper.example.*/ ]
  config.action_cable.allowed_request_origins = [ 'https://' + ENV['BAMBOO_HOST'], 'http://' + ENV['BAMBOO_HOST'] ]
  config.web_console.whitelisted_ips = '127.0.0.1'
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  Rails.application.routes.default_url_options[:host] = ENV['BAMBOO_HOST']
  # Rails.application.routes.default_url_options[:port] = 3000
  # config.action_mailer.default_url_options = { host: 'hesper.example.com', :protocol => 'http' }
  # config.action_mailer.smtp_settings   = {
  #   :enable_starttls_auto => true,
  #   :address => ENV['BAMBOO_MAIL_SERVER'],
  #   :port => 587,
  #   :domain => ENV['BAMBOO_MAIL_DOMAIN'],
  #   :user_name => ENV['BAMBOO_MAIL_USER'],
  #   :password => ENV['BAMBOO_MAIL_PASSWORD'],
  #   :authentication => ENV['BAMBOO_MAIL_AUTH'],
  # }
  config.action_mailer.delivery_method = :letter_opener_web
end

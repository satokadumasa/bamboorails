source 'https://rubygems.org'
source 'https://rails-assets.org'  # rails-assets.org を source として指定しておく
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# i18n
gem 'i18n_generators'
gem 'rails-i18n'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'carrierwave'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'ransack'
gem 'kaminari'
gem 'bootsnap', '>= 1.1.0', require: false

# 認証
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'cancancan'
gem 'rolify'

group :development do #開発環境のみ
  gem 'letter_opener_web'
end
# Nginx
# gem "sinatra"
# gem "sinatra-contrib"
# gem "unicorn"

# bootstrap
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

# Pagenation
gem 'will_paginate'
gem 'bootstrap-will_paginate'

#backbone.js
gem 'rails-assets-lodash'
gem 'rails-assets-backbone'
# gem 'faye-websocket'
# gem 'websocket-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'carrirewave'
gem 'rmagick'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# RailsAdmin
gem 'rails_admin', '~> 1.3'

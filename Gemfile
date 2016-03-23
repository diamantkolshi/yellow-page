source "https://rubygems.org"

ruby "2.3.0"

gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem "honeybadger" 
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "sqlite3"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem "uglifier"
gem "devise"
gem "rails_admin"
gem 'bootstrap-sass', '~> 3.3.6'
gem 'faker'
gem "rails_panel"
gem 'carrierwave'
gem 'will_paginate', '~> 3.0.5'
gem 'cancancan'


group :development do
  gem "quiet_assets"
  gem "refills"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
  gem 'better_errors'
  gem "binding_of_caller"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end

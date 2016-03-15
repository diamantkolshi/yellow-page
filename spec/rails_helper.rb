if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.configure do |config|
    config.logger.level = Logger::WARN
  end
  CodeClimate::TestReporter.start
end

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start "rails"
end

ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "webmock/rspec"
require "shoulda/matchers"

Dir[File.expand_path(File.join(File.dirname(__FILE__),"support","**","*.rb"))].each {|f| require f}

Delayed::Worker.delay_jobs = false

Capybara.javascript_driver = :webkit
Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = true
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures  = false
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view

  config.infer_spec_type_from_file_location!
end

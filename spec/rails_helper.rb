ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'

require 'fabrication'
require 'coveralls'

Coveralls.wear!

Fabrication.configure do |config|
  config.path_prefix = '.'
  config.fabricator_path = %w[spec/fabricators spec/dummy/spec/fabricators]
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
end

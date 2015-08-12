ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'vcr'

OmniAuth.configure do |config|
  config.test_mode = true
  config.add_mock(:google_oauth2, OmniAuth::AuthHash.new({
    provider: "google_oauth2",
    uid: "123456789",
    info: {
      name: "John Doe",
      email: "john@crowdint.com"
    },
    credentials: {
      token: "token",
      refresh_token: "another_token",
      expires_at: 1354920555,
      expires: true
    }})
  )
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options =  { record: :none }
  c.configure_rspec_metadata!
  c.ignore_localhost = true
  c.allow_http_connections_when_no_cassette = true
end

Capybara.default_host = 'http://localhost:3000'

RSpec.configure do |config|

config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end

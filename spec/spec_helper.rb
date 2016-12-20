require 'rspec/its'
require 'webmock'
require 'vcr'
require_relative 'helpers/vcr_helpers'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true

  include VcrHelpers
  remove_basic_auth = ->(sample) { remove_basic_auth!(sample.request) }
  config.before_record(&remove_basic_auth)
  config.before_playback(&remove_basic_auth)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include VcrHelpers, :integration

  config.around(:each, :integration) do |example|
    request_matchers = [:method, match_uri_without_basic_auth]
    VCR.use_cassette(example.metadata[:full_description], match_requests_on: request_matchers) do
      example.run
    end
  end
end

require 'vcr'
require 'webmock/rspec'

real_requests = ENV['REAL_REQUESTS']

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/support/vcr_cassettes'
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true if real_requests
  config.default_cassette_options = {:record => :new_episodes}
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    VCR.eject_cassette
  end if real_requests

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed

  # list the 10 slowest tests at end of suite
  # config.profile_examples = 10
end

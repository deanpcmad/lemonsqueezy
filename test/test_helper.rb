$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "lemon_squeezy"
require "minitest/autorun"
require "faraday"
require "json"
require "vcr"
require "dotenv/load"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :faraday

  config.filter_sensitive_data("<AUTHORIZATION>") { ENV["LEMON_SQUEEZY_API_KEY_TEST"] }
  config.default_cassette_options = {
    record: :once,
    match_requests_on: [:method, lambda { |request1, request2|
      uri1 = URI(request1.uri)
      uri2 = URI(request2.uri)
      
      # Compare only the path part of the URI, ignoring query parameters
      uri1.path == uri2.path
    }]
  }
end

LemonSqueezy.configure do |config|
  config.api_key = ENV["LEMON_SQUEEZY_API_KEY_TEST"]
end

class Minitest::Test

  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

end

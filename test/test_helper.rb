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
end

LemonSqueezy.configure do |config|
  config.api_key = ENV["LEMON_SQUEEZY_API_KEY_TEST"]
end

class Minitest::Test
  def stub_response(fixture:, status: 200, headers: {"Content-Type" => "application/json"})
    [status, headers, File.read("test/fixtures/#{fixture}.json")]
  end

  def stub_request(path, response:, body: {})
    stubs = Faraday::Adapter::Test::Stubs.new
    stubs.post("/api/#{path}") do
      stub_response(fixture: response)
    end
    stubs
  end
end

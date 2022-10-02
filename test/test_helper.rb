$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "lemon_squeezy"
require "minitest/autorun"
require "faraday"
require "json"

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

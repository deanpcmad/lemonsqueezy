require "test_helper"

class ConfigurationTest < Minitest::Test

  def setup
    LemonSqueezy.config.api_key = "abc123"
  end

  def test_api_key
    assert_equal "abc123", LemonSqueezy.config.api_key
  end

end

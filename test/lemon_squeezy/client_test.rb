require "test_helper"

class ClientTest < Minitest::Test
  def test_access_token
    client = LemonSqueezy::Client.new access_token: "123"
    assert_equal "123", client.access_token
  end
end

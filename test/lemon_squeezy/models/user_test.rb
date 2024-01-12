require "test_helper"

class UserTest < Minitest::Test

  def test_user_me
    user = LemonSqueezy::User.me

    assert_equal LemonSqueezy::User, user.class
    assert_equal "dean@voupe.dev", user.email
  end

end

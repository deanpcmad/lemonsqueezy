require "test_helper"

class LicenseKeyTest < Minitest::Test

  def test_license_key_list
    keys = LemonSqueezy::LicenseKey.list

    assert_equal LemonSqueezy::Collection, keys.class
    assert_equal LemonSqueezy::LicenseKey, keys.data.first.class
    assert_equal "Dean Dev", keys.data.first.user_name
  end

  def test_license_key_list_by_store
    keys = LemonSqueezy::LicenseKey.list store_id: 51385

    assert_equal LemonSqueezy::Collection, keys.class
    assert_equal LemonSqueezy::LicenseKey, keys.data.first.class
    assert_equal "Dean Dev", keys.data.first.user_name
  end

  def test_license_key_list_by_order
    keys = LemonSqueezy::LicenseKey.list order_id: 1899988

    assert_equal LemonSqueezy::Collection, keys.class
    assert_equal LemonSqueezy::LicenseKey, keys.data.first.class
    assert_equal "Dean Dev", keys.data.first.user_name
  end

  def test_license_key_retrieve
    key = LemonSqueezy::LicenseKey.retrieve id: 384199

    assert_equal LemonSqueezy::LicenseKey, key.class
    assert_equal "Dean Dev", key.user_name
    assert_equal "inactive", key.status
  end

  def test_license_key_update
    key = LemonSqueezy::LicenseKey.update id: 384199, activation_limit: 2

    assert_equal LemonSqueezy::LicenseKey, key.class
    assert_equal "Dean Dev", key.user_name
    assert_equal 2, key.activation_limit
  end

end

require "test_helper"

class LicenseTest < Minitest::Test

  def test_license_validate
    key = LemonSqueezy::License.validate key: "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7"

    assert_equal LemonSqueezy::License, key.class
    assert_equal true, key.valid
    assert_equal "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7", key.license_key.key
  end

  def test_license_activate
    key = LemonSqueezy::License.activate key: "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7", instance: "Test"

    assert_equal LemonSqueezy::License, key.class
    assert_equal true, key.activated
    assert_equal "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7", key.license_key.key
    assert_equal "f3de3801-999e-42b8-b620-cc06ec09c461", key.instance.id
    assert_equal "Test", key.instance.name
  end

  def test_license_deactivate
    key = LemonSqueezy::License.deactivate key: "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7", instance: "f3de3801-999e-42b8-b620-cc06ec09c461"

    assert_equal LemonSqueezy::License, key.class
    assert_equal true, key.deactivated
    assert_equal "9AE0D3F6-A7CD-43C6-BF08-17208F679CD7", key.license_key.key
  end

end

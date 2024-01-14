require "test_helper"

class LicenseKeyInstanceTest < Minitest::Test

  def test_license_key_instance_list
    instances = LemonSqueezy::LicenseKeyInstance.list

    assert_equal LemonSqueezy::Collection, instances.class
    assert_equal LemonSqueezy::LicenseKeyInstance, instances.data.first.class
    assert_equal "Test1", instances.data.first.name
  end

  def test_license_key_instance_list_by_license_key
    instances = LemonSqueezy::LicenseKeyInstance.list license_key_id: 385359

    assert_equal LemonSqueezy::Collection, instances.class
    assert_equal LemonSqueezy::LicenseKeyInstance, instances.data.first.class
    assert_equal "Test1", instances.data.first.name
    assert_equal 385359, instances.data.first.license_key_id
  end

  def test_license_key_instance_retrieve
    instance = LemonSqueezy::LicenseKeyInstance.retrieve id: 707185

    assert_equal LemonSqueezy::LicenseKeyInstance, instance.class
    assert_equal "Test1", instance.name
    assert_equal 385359, instance.license_key_id
  end

end

require "test_helper"

class StoreTest < Minitest::Test

  def test_store_list
    stores = LemonSqueezy::Store.list

    assert_equal LemonSqueezy::Collection, stores.class
    assert_equal LemonSqueezy::Store, stores.data.first.class
    assert_equal "VoupeDev", stores.data.first.name
  end

  def test_store_retrieve
    store = LemonSqueezy::Store.retrieve id: 51385

    assert_equal LemonSqueezy::Store, store.class
    assert_equal "VoupeDev", store.name
    assert_equal "voupedev", store.slug
  end

end

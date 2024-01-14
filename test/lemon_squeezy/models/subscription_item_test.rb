require "test_helper"

class SubscriptionItemTest < Minitest::Test

  def test_subscription_item_list
    items = LemonSqueezy::SubscriptionItem.list

    assert_equal LemonSqueezy::Collection, items.class
    assert_equal LemonSqueezy::SubscriptionItem, items.data.first.class
    assert_equal 1, items.data.first.quantity
  end

  def test_subscription_item_list_by_subscription
    items = LemonSqueezy::SubscriptionItem.list subscription_id: 176706

    assert_equal LemonSqueezy::Collection, items.class
    assert_equal LemonSqueezy::SubscriptionItem, items.data.first.class
    assert_equal 1, items.data.first.quantity
  end

  def test_subscription_item_retrieve
    item = LemonSqueezy::SubscriptionItem.retrieve id: 139332

    assert_equal LemonSqueezy::SubscriptionItem, item.class
    assert_equal 1, item.quantity
    assert_equal false, item.is_usage_based
  end

  def test_subscription_item_update
    item = LemonSqueezy::SubscriptionItem.update id: 139332, quantity: 2

    assert_equal LemonSqueezy::SubscriptionItem, item.class
    assert_equal 2, item.quantity
    assert_equal false, item.is_usage_based
  end

end

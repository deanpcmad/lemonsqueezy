require "test_helper"

class SubscriptionTest < Minitest::Test

  def test_subscription_list
    subscriptions = LemonSqueezy::Subscription.list

    assert_equal LemonSqueezy::Collection, subscriptions.class
    assert_equal LemonSqueezy::Subscription, subscriptions.data.first.class
    assert_equal "Dean Dev", subscriptions.data.first.user_name
    assert_equal "SaaS Gold Plan", subscriptions.data.first.product_name
  end

  def test_subscription_list_by_store
    subscriptions = LemonSqueezy::Subscription.list store_id: 51385

    assert_equal LemonSqueezy::Collection, subscriptions.class
    assert_equal LemonSqueezy::Subscription, subscriptions.data.first.class
    assert_equal "Dean Dev", subscriptions.data.first.user_name
    assert_equal "SaaS Gold Plan", subscriptions.data.first.product_name
  end

  def test_subscription_list_by_order
    subscriptions = LemonSqueezy::Subscription.list order_id: 1541086

    assert_equal LemonSqueezy::Collection, subscriptions.class
    assert_equal LemonSqueezy::Subscription, subscriptions.data.first.class
    assert_equal "Dean Dev", subscriptions.data.first.user_name
    assert_equal "SaaS Gold Plan", subscriptions.data.first.product_name
  end

  def test_subscription_list_by_product
    subscriptions = LemonSqueezy::Subscription.list product_id: 128225

    assert_equal LemonSqueezy::Collection, subscriptions.class
    assert_equal LemonSqueezy::Subscription, subscriptions.data.first.class
    assert_equal "Dean Dev", subscriptions.data.first.user_name
    assert_equal "SaaS Gold Plan", subscriptions.data.first.product_name
  end

  def test_subscription_retrieve
    subscription = LemonSqueezy::Subscription.retrieve id: 176706

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal "Dean Dev", subscription.user_name
    assert_equal "visa", subscription.card_brand
    assert_equal "4242", subscription.card_last_four
  end

  def test_subscription_update
    subscription = LemonSqueezy::Subscription.update id: 176705, variant_id: 149092, invoice_immediately: true

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal 128225, subscription.product_id
  end

  def test_subscription_pause
    subscription = LemonSqueezy::Subscription.pause id: 176705, kind: "void", resumes_at: "2024-02-01"

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal "void", subscription.pause.mode
  end

  def test_subscription_unpause
    subscription = LemonSqueezy::Subscription.unpause id: 176705

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_nil subscription.pause
  end

  def test_subscription_cancel
    subscription = LemonSqueezy::Subscription.cancel id: 176705

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal "cancelled", subscription.status
  end

  def test_subscription_uncancel
    subscription = LemonSqueezy::Subscription.uncancel id: 176705

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal "active", subscription.status
  end

  def test_subscription_change_plan
    subscription = LemonSqueezy::Subscription.change_plan id: 176705, plan_id: 128224, variant_id: 149091

    assert_equal LemonSqueezy::Subscription, subscription.class
    assert_equal "SaaS Silver Plan", subscription.product_name
  end

end

require "test_helper"

class WebhookTest < Minitest::Test

  def test_webhook_list
    webhooks = LemonSqueezy::Webhook.list

    assert_equal LemonSqueezy::Collection, webhooks.class
    assert_equal LemonSqueezy::Webhook, webhooks.data.first.class
    assert_equal "http://localhost:3000/webhook", webhooks.data.first.url
  end

  def test_webhook_list_by_store
    webhooks = LemonSqueezy::Webhook.list store_id: 51385

    assert_equal LemonSqueezy::Collection, webhooks.class
    assert_equal LemonSqueezy::Webhook, webhooks.data.first.class
    assert_equal "http://localhost:3000/webhook", webhooks.data.first.url
  end

  def test_webhook_retrieve
    webhook = LemonSqueezy::Webhook.retrieve id: 11630

    assert_equal LemonSqueezy::Webhook, webhook.class
    assert_equal "http://localhost:3000/webhook", webhook.url
  end

  def test_webhook_create
    webhook = LemonSqueezy::Webhook.create store_id: 51385, url: "http://localhost:3000/webhook", secret: "abc123", events: ["order_created"]

    assert_equal LemonSqueezy::Webhook, webhook.class
    assert_equal 51385, webhook.store_id
  end

  def test_webhook_update
    webhook = LemonSqueezy::Webhook.update id: 11630, events: ["order_created", "subscription_created"]

    assert_equal LemonSqueezy::Webhook, webhook.class
    assert_equal "subscription_created", webhook.events.last
  end

  def test_webhook_delete
    webhook = LemonSqueezy::Webhook.delete id: 11630

    assert_equal true, webhook
  end

end

require "test_helper"

class SubscriptionInvoiceTest < Minitest::Test

  def test_subscription_invoice_list
    invoices = LemonSqueezy::SubscriptionInvoice.list

    assert_equal LemonSqueezy::Collection, invoices.class
    assert_equal LemonSqueezy::SubscriptionInvoice, invoices.data.first.class
    assert_equal "Dean Dev", invoices.data.first.user_name
    assert_equal "paid", invoices.data.first.status
  end

  def test_subscription_invoice_list_by_store
    invoices = LemonSqueezy::SubscriptionInvoice.list store_id: 51385

    assert_equal LemonSqueezy::Collection, invoices.class
    assert_equal LemonSqueezy::SubscriptionInvoice, invoices.data.first.class
    assert_equal "Dean Dev", invoices.data.first.user_name
    assert_equal "paid", invoices.data.first.status
  end

  def test_subscription_invoice_list_by_status
    invoices = LemonSqueezy::SubscriptionInvoice.list status: "paid"

    assert_equal LemonSqueezy::Collection, invoices.class
    assert_equal LemonSqueezy::SubscriptionInvoice, invoices.data.first.class
    assert_equal "Dean Dev", invoices.data.first.user_name
    assert_equal "paid", invoices.data.first.status
  end

  def test_subscription_invoice_retrieve
    invoice = LemonSqueezy::SubscriptionInvoice.retrieve id: 549936

    assert_equal LemonSqueezy::SubscriptionInvoice, invoice.class
    assert_equal 1584868, invoice.customer_id
    assert_equal "Dean Dev", invoice.user_name
  end

end

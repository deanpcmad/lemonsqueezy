require "test_helper"

class OrderTest < Minitest::Test

  def test_order_list
    orders = LemonSqueezy::Order.list

    assert_equal LemonSqueezy::Collection, orders.class
    assert_equal LemonSqueezy::Order, orders.data.first.class
    assert_equal "Dean Dev", orders.data.first.user_name
  end

  def test_order_list_by_store
    orders = LemonSqueezy::Order.list store_id: 51385

    assert_equal LemonSqueezy::Collection, orders.class
    assert_equal LemonSqueezy::Order, orders.data.first.class
    assert_equal "Dean Dev", orders.data.first.user_name
  end

  def test_order_list_by_email
    orders = LemonSqueezy::Order.list email: "test@voupe.dev"

    assert_equal LemonSqueezy::Collection, orders.class
    assert_equal LemonSqueezy::Order, orders.data.first.class
    assert_equal "Dean Dev", orders.data.first.user_name
  end

  def test_order_retrieve
    order = LemonSqueezy::Order.retrieve id: 1899988

    assert_equal LemonSqueezy::Order, order.class
    assert_equal "Dean Dev", order.user_name
    assert_equal 999, order.subtotal
  end

end

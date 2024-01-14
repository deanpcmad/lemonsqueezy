require "test_helper"

class CheckoutTest < Minitest::Test

  def test_checkout_list
    checkouts = LemonSqueezy::Checkout.list

    assert_equal LemonSqueezy::Collection, checkouts.class
    assert_equal LemonSqueezy::Checkout, checkouts.data.first.class
    assert_equal 149091, checkouts.data.first.variant_id
  end

  def test_checkout_retrieve
    checkout = LemonSqueezy::Checkout.retrieve id: "ffba2628-bd02-4d2f-989f-fb690e8a852d"

    assert_equal LemonSqueezy::Checkout, checkout.class
    assert_equal 149091, checkout.variant_id
  end

  def test_checkout_create
    checkout = LemonSqueezy::Checkout.create store_id: 51385, variant_id: 149091

    assert_equal LemonSqueezy::Checkout, checkout.class
    assert_equal 149091, checkout.variant_id
  end

end

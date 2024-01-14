require "test_helper"

class DiscountTest < Minitest::Test

  def test_discount_list
    discounts = LemonSqueezy::Discount.list

    assert_equal LemonSqueezy::Collection, discounts.class
    assert_equal LemonSqueezy::Discount, discounts.data.first.class
    assert_equal "10OFF", discounts.data.first.code
  end

  def test_discount_list_by_store
    discounts = LemonSqueezy::Discount.list store_id: 51385

    assert_equal LemonSqueezy::Collection, discounts.class
    assert_equal LemonSqueezy::Discount, discounts.data.first.class
    assert_equal "10OFF", discounts.data.first.code
  end

  def test_discount_retrieve
    discount = LemonSqueezy::Discount.retrieve id: 80554

    assert_equal LemonSqueezy::Discount, discount.class
    assert_equal "10OFF", discount.code
    assert_equal 10, discount.amount
    assert_equal "percent", discount.amount_type
  end

  def test_discount_create
    discount = LemonSqueezy::Discount.create store_id: 51385, name: "20% OFF", code: "20OFF", amount: 20, amount_type: "percent"

    assert_equal LemonSqueezy::Discount, discount.class
    assert_equal "20OFF", discount.code
    assert_equal 20, discount.amount
    assert_equal "percent", discount.amount_type
  end

  def test_discount_delete
    discount = LemonSqueezy::Discount.delete id: 80555

    assert_equal true, discount
  end

end

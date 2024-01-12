require "test_helper"

class PriceTest < Minitest::Test

  def test_price_list
    prices = LemonSqueezy::Price.list

    assert_equal LemonSqueezy::Collection, prices.class
    assert_equal LemonSqueezy::Price, prices.data.first.class
    assert_equal 999, prices.data.first.unit_price
  end

  def test_price_list_for_variant
    products = LemonSqueezy::Price.list variant_id: 149091

    assert_equal LemonSqueezy::Collection, products.class
    assert_equal LemonSqueezy::Price, products.data.first.class
    assert_equal 999, products.data.first.unit_price
    assert_equal "year", products.data.first.renewal_interval_unit
  end

  def test_price_retrieve
    product = LemonSqueezy::Price.retrieve id: 233122

    assert_equal LemonSqueezy::Price, product.class
    assert_equal 999, product.unit_price
  end

end

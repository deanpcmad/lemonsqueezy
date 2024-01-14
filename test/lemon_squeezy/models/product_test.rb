require "test_helper"

class ProductTest < Minitest::Test

  def test_product_list
    products = LemonSqueezy::Product.list

    assert_equal LemonSqueezy::Collection, products.class
    assert_equal LemonSqueezy::Product, products.data.first.class
    assert_equal "A Test Item", products.data.first.name
  end

  def test_product_list_by_store
    products = LemonSqueezy::Product.list store_id: 51385

    assert_equal LemonSqueezy::Collection, products.class
    assert_equal LemonSqueezy::Product, products.data.first.class
    assert_equal "A Test Item", products.data.first.name
  end

  def test_product_retrieve
    product = LemonSqueezy::Product.retrieve id: 128225

    assert_equal LemonSqueezy::Product, product.class
    assert_equal "SaaS Gold Plan", product.name
  end

end

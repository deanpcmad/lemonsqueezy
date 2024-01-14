require "test_helper"

class VariantTest < Minitest::Test

  def test_variant_list
    variants = LemonSqueezy::Variant.list

    assert_equal LemonSqueezy::Collection, variants.class
    assert_equal LemonSqueezy::Variant, variants.data.first.class
    assert_equal 1000, variants.data.first.price
  end

  def test_variant_list_for_product
    variants = LemonSqueezy::Variant.list product_id: 128224

    assert_equal LemonSqueezy::Collection, variants.class
    assert_equal LemonSqueezy::Variant, variants.data.first.class
    assert_equal 1000, variants.data.first.price
  end

  def test_variant_retrieve
    product = LemonSqueezy::Variant.retrieve id: 149091

    assert_equal LemonSqueezy::Variant, product.class
    assert_equal 1000, product.price
    assert_equal 128224, product.product_id
  end

end

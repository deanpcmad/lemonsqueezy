require "test_helper"

class DiscountRedemptionTest < Minitest::Test

  def test_discount_redemption_list
    redemptions = LemonSqueezy::DiscountRedemption.list

    assert_equal LemonSqueezy::Collection, redemptions.class
    assert_equal LemonSqueezy::DiscountRedemption, redemptions.data.first.class
    assert_equal "10OFF", redemptions.data.first.discount_code
  end

  def test_discount_redemption_list_by_discount
    redemptions = LemonSqueezy::DiscountRedemption.list discount_id: 80554

    assert_equal LemonSqueezy::Collection, redemptions.class
    assert_equal LemonSqueezy::DiscountRedemption, redemptions.data.first.class
    assert_equal "10OFF", redemptions.data.first.discount_code
  end

  def test_discount_redemption_list_by_order
    redemptions = LemonSqueezy::DiscountRedemption.list order_id: 1907731

    assert_equal LemonSqueezy::Collection, redemptions.class
    assert_equal LemonSqueezy::DiscountRedemption, redemptions.data.first.class
    assert_equal "10OFF", redemptions.data.first.discount_code
  end

  def test_discount_redemption_retrieve
    redemption = LemonSqueezy::DiscountRedemption.retrieve id: 170576

    assert_equal LemonSqueezy::DiscountRedemption, redemption.class
    assert_equal "10OFF", redemption.discount_code
  end

end

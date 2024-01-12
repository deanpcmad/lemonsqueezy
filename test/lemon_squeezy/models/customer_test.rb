require "test_helper"

class CustomerTest < Minitest::Test

  def test_customer_list
    customers = LemonSqueezy::Customer.list

    assert_equal LemonSqueezy::Collection, customers.class
    assert_equal LemonSqueezy::Customer, customers.data.first.class
    assert_equal "Dean Dev", customers.data.first.name
  end

  def test_customer_list_by_store
    customers = LemonSqueezy::Customer.list store_id: 51385

    assert_equal LemonSqueezy::Collection, customers.class
    assert_equal LemonSqueezy::Customer, customers.data.first.class
    assert_equal "test@voupe.dev", customers.data.first.email
  end

  def test_customer_list_by_email
    customers = LemonSqueezy::Customer.list email: "test@voupe.dev"

    assert_equal LemonSqueezy::Collection, customers.class
    assert_equal LemonSqueezy::Customer, customers.data.first.class
    assert_equal "test@voupe.dev", customers.data.first.email
  end

  def test_customer_retrieve
    customer = LemonSqueezy::Customer.retrieve id: 1584868

    assert_equal LemonSqueezy::Customer, customer.class
    assert_equal "Dean Dev", customer.name
  end

  def test_customer_create
    customer = LemonSqueezy::Customer.create store_id: 51385, name: "Dean Dev Again", email: "test@voupe.dev"

    assert_equal LemonSqueezy::Customer, customer.class
    assert_equal "Dean Dev Again", customer.name
  end

  def test_customer_update
    customer = LemonSqueezy::Customer.update id: 1584616, name: "Dean Dev Updated"

    assert_equal LemonSqueezy::Customer, customer.class
    assert_equal "Dean Dev Updated", customer.name
  end

end

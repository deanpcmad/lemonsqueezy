# LemonSqueezy

**This Library is a work in progress**

A Ruby library for the Lemon Squeezy API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lemonsqueezy"
```

## Usage

### Set API Key

Firstly you'll need to create an API Key on your [settings page](https://app.lemonsqueezy.com/settings/api).

```ruby
LemonSqueezy.configure do |config|
  config.api_key = ENV["LEMON_SQUEEZY_API_KEY"]
end
```

### Stores

```ruby
# Retrieves a list of Stores
LemonSqueezy::Store.list

# Retrieves a Store
LemonSqueezy::Store.retrieve id: "123"
```

### Customers

```ruby
# Retrieves a list of Customers
LemonSqueezy::Customer.list

# Retrieves a list of Customers for a store
LemonSqueezy::Customer.list store_id: 123

# Retrieves a list of Customers that contain the supplied email
LemonSqueezy::Customer.list email: "test@hello.com"

# Retrieves a Customer
LemonSqueezy::Customer.retrieve id: "123"

# Create a customer
# https://docs.lemonsqueezy.com/api/customers#create-a-customer
LemonSqueezy::Customer.create store_id: 123, name: "Customer name", email: "test@hello.com"

# Update a customer
# https://docs.lemonsqueezy.com/api/customers#update-a-customer
LemonSqueezy::Customer.update id: 123, name: "Customer name", status: "archived"
```

### Products

```ruby
# Retrieves a list of Products
LemonSqueezy::Product.list

# Retrieves a list of Products for a specified Store
LemonSqueezy::Product.list store_id: 123

# Retrieves a Product
LemonSqueezy::Product.retrieve id: "123"
```

### Product Variants

```ruby
# Retrieves a list of Variants
LemonSqueezy::Variant.list

# Retrieves a list of Variants for a Product
LemonSqueezy::Variant.list product_id: 123

# Retrieves a Variant
LemonSqueezy::Variant.retrieve id: "123"
```

### Prices

```ruby
# Retrieves a list of Prices
LemonSqueezy::Price.list

# Retrieves a list of Prices for a Variant
LemonSqueezy::Price.list variant_id: 123

# Retrieves a Price
LemonSqueezy::Price.retrieve id: "123"
```

### Orders

```ruby
# Retrieves a list of Orders
LemonSqueezy::Order.list

# Retrieves a list of Orders for a specified store
LemonSqueezy::Order.list product_id: 123

# Retrieves a list of Orders for an email address
LemonSqueezy::Order.list email: "hello@test.com"

# Retrieves an Order
LemonSqueezy::Order.retrieve id: "123"

# Retrieves the items on an Order
LemonSqueezy::Order.retrieve order_items: "123"
```

### Subscriptions

```ruby
# Retrieves a list of Subscriptions
LemonSqueezy::Subscription.list

# Retrieves a list of Subscriptions for a store
LemonSqueezy::Subscription.list store_id: 123

# Retrieves a list of Subscriptions for an Order
LemonSqueezy::Subscription.list order_id: 123

# Retrieves a list of Subscriptions for a product
LemonSqueezy::Subscription.list product_id: 123

# Retrieves a Subscription
LemonSqueezy::Subscription.retrieve id: 123

# Updates a Subscription
# https://docs.lemonsqueezy.com/api/subscriptions#update-a-subscription
LemonSqueezy::Subscription.update id: 123, variant_id: 123

# Pauses a Subscription
# Kind should be void or free
# resumes_at can be nil or an ISO-8601 formatted date-time string indicating
# when the subscription will continue collecting payments.
LemonSqueezy::Subscription.pause id: 123, kind: "void", resumes_at: nil

# Un-Pause a Subscription
LemonSqueezy::Subscription.unpause id: 123

# Cancel a Subscription
LemonSqueezy::Subscription.cancel id: 123

# Un-Cancel a Subscription
LemonSqueezy::Subscription.uncancel id: 123

# Change the Plan for a Subscription
LemonSqueezy::Subscription.change_plan id: 123, plan_id: 111, variant_id: 111
```

### Subscription Invoices

```ruby
# Retrieves a list of Subscription Invoices
LemonSqueezy::SubscriptionInvoice.list

# Retrieves a list of Subscription Invoices for a specified Store
LemonSqueezy::SubscriptionInvoice.list store_id: 123

# Retrieves a Subscription Invoice
LemonSqueezy::SubscriptionInvoice.retrieve id: "123"
```

### Subscription Items

```ruby
# Retrieves a list of Subscription Items
LemonSqueezy::SubscriptionItem.list

# Retrieves a list of Subscription Items for a specified Subscription
LemonSqueezy::SubscriptionItem.list subscription_id: 123

# Retrieves a Subscription Item
LemonSqueezy::SubscriptionItem.retrieve id: "123"

# Updates a Subscription Item
# https://docs.lemonsqueezy.com/api/subscription-items#update-a-subscription-item
LemonSqueezy::SubscriptionItem.update id: "123", quantity: 2

# Retrieve subscription item's current usage
# Returns 404 if the product/variant does not have usage based billing enabled
# https://docs.lemonsqueezy.com/api/subscription-items#retrieve-a-subscription-item-s-current-usage
LemonSqueezy::SubscriptionItem.current_usage id: "123"
```

### Discounts

```ruby
# Retrieves a list of Discounts
LemonSqueezy::Discount.list

# Retrieves a list of Discounts for a store
LemonSqueezy::Discount.list store_id: 123

# Retrieves a Discount
LemonSqueezy::Discount.retrieve id: "123"
```

### License Keys

```ruby
# Retrieves a list of License Keys
LemonSqueezy::LicenseKey.list

# Retrieves a list of License Keys for a store
LemonSqueezy::LicenseKey.list store_id: 123

# Retrieves a list of License Keys for an order
LemonSqueezy::LicenseKey.list order_id: 123

# Retrieves a Discount
LemonSqueezy::LicenseKey.retrieve id: "123"
```

### Files

```ruby
# Retrieves a list of Files
LemonSqueezy::File.list

# Retrieves a File
LemonSqueezy::File.retrieve id: "123"
```

### License Key Instances

```ruby
# Retrieves a list of License Key Instances
LemonSqueezy::LicenseKeyInstances.list

# Retrieves a list of License Key Instances for a license key
LemonSqueezy::LicenseKeyInstances.list license_key_id: 123

# Retrieves a License Key Instance
LemonSqueezy::LicenseKeyInstances.retrieve id: "123"
```

### Checkouts

```ruby
# Retrieves a list of Checkouts
LemonSqeezy::Checkout.list

# Retrieves a list of Checkouts for a store
LemonSqeezy::Checkout.list store_id: 123

# Retrieves a list of Checkouts for a variant
LemonSqeezy::Checkout.list variant_id: 123

# Retrieves a Checkout
LemonSqeezy::Checkout.retrieve id: "123"

# Creates a Checkout
# View docs for more info: https://docs.lemonsqueezy.com/api/checkouts#create-a-checkout
# store_id and variant_id are required
# Any other parameters are send as "attributes" to the API
LemonSqueezy::Checkout.create store_id: 123, variant_id: 321, custom_price: 500, product_options: {name: "a test name"}
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/lemonsqueezy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

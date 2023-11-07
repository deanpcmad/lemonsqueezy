# LemonSqueezy

**This Library is a work in progress**

This is a Ruby library for interacting with the Lemon Squeezy API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lemonsqueezy"
```

## Usage

### Set Access Token

Firstly you'll need to create an API Access Token on your [settings page](https://app.lemonsqueezy.com/settings/api).

```ruby
@client = LemonSqueezy::Client.new(access_token: "")
```

### Stores

```ruby
# Retrieves a list of Stores
@client.stores.list

# Retrieves a Store
@client.stores.retrieve id: "123"
```

### Products

```ruby
# Retrieves a list of Products
@client.products.list

# Retrieves a list of Products for a specified Store
@client.products.list store_id: 123

# Retrieves a Product
@client.products.get id: "123"
```

### Product Variants

```ruby
# Retrieves a list of Variants
@client.variants.list

# Retrieves a list of Variants for a Product
@client.variants.list product_id: 123

# Retrieves a Variant
@client.variants.get id: "123"
```

### Orders

```ruby
# Retrieves a list of Orders
@client.orders.list

# Retrieves a list of Orders for a specified store
@client.orders.list product_id: 123

# Retrieves a list of Orders for an email address
@client.orders.list email: "hello@test.com"

# Retrieves an Order
@client.orders.get id: "123"

# Retrieves the items on an Order
@client.orders.get order_items: "123"
```

### Subscriptions

```ruby
# Retrieves a list of Subscriptions
@client.subscriptions.list

# Retrieves a list of Subscriptions for a store
@client.subscriptions.list store_id: 123

# Retrieves a list of Subscriptions for an Order
@client.subscriptions.list order_id: 123

# Retrieves a list of Subscriptions for a product
@client.subscriptions.list product_id: 123

# Retrieves a Subscription
@client.subscriptions.get id: 123

# Pauses a Subscription
# Kind should be void or free
# resumes_at can be nil or an ISO-8601 formatted date-time string indicating
# when the subscription will continue collecting payments.
@client.subscriptions.pause id: 123, kind: "void", resumes_at: nil

# Un-Pause a Subscription
@client.subscriptions.unpause id: 123

# Cancel a Subscription
@client.subscriptions.cancel id: 123

# Un-Cancel a Subscription
@client.subscriptions.uncancel id: 123

# Change the Plan for a Subscription
@client.subscriptions.change_plan id: 123, plan_id: 111, variant_id: 111
```

### Subscription Invoices

```ruby
# Retrieves a list of Subscription Invoices
@client.subscription_invoices.list

# Retrieves a list of Subscription Invoices for a specified Store
@client.subscription_invoices.list store_id: 123

# Retrieves a Subscription Invoice
@client.subscription_invoices.get id: "123"
```

### Discounts

```ruby
# Retrieves a list of Discounts
@client.discounts.list

# Retrieves a list of Discounts for a store
@client.discounts.list store_id: 123

# Retrieves a Discount
@client.discounts.get id: "123"
```

### License Keys

```ruby
# Retrieves a list of License Keys
@client.license_keys.list

# Retrieves a list of License Keys for a store
@client.license_keys.list store_id: 123

# Retrieves a list of License Keys for an order
@client.license_keys.list order_id: 123

# Retrieves a Discount
@client.license_keys.get id: "123"
```

### Files

```ruby
# Retrieves a list of Files
@client.files.list

# Retrieves a File
@client.files.get id: "123"
```

### Customers

```ruby
# Retrieves a list of Customers
@client.customers.list

# Retrieves a list of Customers for a store
@client.customers.list store_id: 123

# Retrieves a list of Customers that contain the supplied email
@client.customers.list email: "test@hello.com"

# Retrieves a Customer
@client.customers.get id: "123"
```

### License Key Instances

```ruby
# Retrieves a list of License Key Instances
@client.license_key_instances.list

# Retrieves a list of License Key Instances for a license key
@client.license_key_instances.list license_key_id: 123

# Retrieves a License Key Instance
@client.license_key_instances.get id: "123"
```

### Checkouts

```ruby
# Retrieves a list of Checkouts
@client.checkouts.list

# Retrieves a list of Checkouts for a store
@client.checkouts.list store_id: 123

# Retrieves a list of Checkouts for a variant
@client.checkouts.list variant_id: 123

# Retrieves a Checkout
@client.checkouts.get id: "123"

# Creates a Checkout
# View docs for more info: https://docs.lemonsqueezy.com/api/checkouts#create-a-checkout
# store_id and variant_id are required
# Any other parameters are send as "attributes" to the API
@client.checkouts.create store_id: 123, variant_id: 321, custom_price: 500, product_options: {name: "a test name"}
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/lemonsqueezy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

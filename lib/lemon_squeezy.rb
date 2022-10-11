# frozen_string_literal: true

require "faraday"

require_relative "lemon_squeezy/version"

module LemonSqueezy
  
  autoload :Client, "lemon_squeezy/client"
  autoload :Collection, "lemon_squeezy/collection"
  autoload :Error, "lemon_squeezy/error"
  autoload :Resource, "lemon_squeezy/resource"
  autoload :Object, "lemon_squeezy/object"

  autoload :StoresResource, "lemon_squeezy/resources/stores"
  autoload :ProductsResource, "lemon_squeezy/resources/products"
  autoload :VariantsResource, "lemon_squeezy/resources/variants"
  autoload :OrdersResource, "lemon_squeezy/resources/orders"
  autoload :SubscriptionsResource, "lemon_squeezy/resources/subscriptions"
  autoload :DiscountsResource, "lemon_squeezy/resources/discounts"
  autoload :LicenseKeysResource, "lemon_squeezy/resources/license_keys"
  autoload :FilesResource, "lemon_squeezy/resources/files"

  autoload :Store, "lemon_squeezy/objects/store"
  autoload :Product, "lemon_squeezy/objects/product"
  autoload :Variant, "lemon_squeezy/objects/variant"
  autoload :Order, "lemon_squeezy/objects/order"
  autoload :OrderItem, "lemon_squeezy/objects/order_item"
  autoload :Subscription, "lemon_squeezy/objects/subscription"
  autoload :Discount, "lemon_squeezy/objects/discount"
  autoload :LicenseKey, "lemon_squeezy/objects/license_key"
  autoload :File, "lemon_squeezy/objects/file"
  
end

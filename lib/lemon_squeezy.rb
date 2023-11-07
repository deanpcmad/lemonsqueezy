# frozen_string_literal: true

require "faraday"

require_relative "lemon_squeezy/version"

module LemonSqueezy

  autoload :Configuration, "lemon_squeezy/configuration"
  autoload :Client, "lemon_squeezy/client"
  autoload :Collection, "lemon_squeezy/collection"
  autoload :Error, "lemon_squeezy/error"
  autoload :Object, "lemon_squeezy/object"

  class << self
    attr_writer :config
  end

  def self.configure
    yield(config) if block_given?
  end

  def self.config
    @config ||= Configuration.new
  end

  autoload :Store, "lemon_squeezy/models/store"
  autoload :Product, "lemon_squeezy/models/product"
  autoload :Variant, "lemon_squeezy/models/variant"
  autoload :Order, "lemon_squeezy/models/order"
  autoload :Subscription, "lemon_squeezy/models/subscription"
  autoload :SubscriptionInvoice, "lemon_squeezy/models/subscription_invoice"
  autoload :SubscriptionItem, "lemon_squeezy/models/subscription_item"
  autoload :SubscriptionUsage, "lemon_squeezy/models/subscription_usage"
  autoload :Discount, "lemon_squeezy/models/discount"
  autoload :LicenseKey, "lemon_squeezy/models/license_key"
  autoload :LicenseKeyInstance, "lemon_squeezy/models/license_key_instance"
  autoload :File, "lemon_squeezy/models/file"
  autoload :Customer, "lemon_squeezy/models/customer"
  autoload :Checkout, "lemon_squeezy/models/checkout"
  autoload :Price, "lemon_squeezy/models/price"

end

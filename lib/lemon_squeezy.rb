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

  autoload :Store, "lemon_squeezy/objects/store"
  autoload :Product, "lemon_squeezy/objects/product"
  
end

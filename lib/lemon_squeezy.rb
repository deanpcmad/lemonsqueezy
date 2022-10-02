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

  autoload :Store, "lemon_squeezy/objects/store"
  
end

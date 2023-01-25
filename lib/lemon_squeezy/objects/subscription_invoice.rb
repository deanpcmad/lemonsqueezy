module LemonSqueezy
  class SubscriptionInvoice < Object

    def initialize(options = {})
      options.delete "relationships"
      options.delete "links"

      super options
    end

  end
end

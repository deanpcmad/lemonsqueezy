module LemonSqueezy
  class Client
    BASE_URL = "https://api.lemonsqueezy.com/v1"

    attr_reader :access_token, :adapter

    def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
      @access_token = access_token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def stores
      StoresResource.new(self)
    end

    def products
      ProductsResource.new(self)
    end

    def variants
      VariantsResource.new(self)
    end

    def orders
      OrdersResource.new(self)
    end

    def subscriptions
      SubscriptionsResource.new(self)
    end

    def discounts
      DiscountsResource.new(self)
    end

    def license_keys
      LicenseKeysResource.new(self)
    end

    def files
      FilesResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token

        conn.headers = {
          "Accept" => "application/vnd.api+json",
          "Content-Type" => "application/vnd.api+json"
        } 

        conn.request :json
        conn.response :json

        conn.adapter adapter, @stubs
      end
    end
  end
end

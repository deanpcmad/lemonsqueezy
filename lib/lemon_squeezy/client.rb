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

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token

        conn.request :json

        conn.response :json, content_type: "application/vnd.api+json"

        conn.adapter adapter, @stubs
      end
    end
  end
end

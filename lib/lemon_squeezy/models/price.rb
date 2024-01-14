module LemonSqueezy
  class Price < Object

    class << self

      def list(**params)
        response = Client.get_request("prices", params: {filter: params})
        Collection.from_response(response, type: Price)
      end

      def retrieve(id:)
        response = Client.get_request("prices/#{id}")
        Price.new(response.body["data"]) if response.success?
      end

    end

  end
end

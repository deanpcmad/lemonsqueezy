module LemonSqueezy
  class Store < Object

    class << self

      def list(**params)
        response = Client.get_request("stores", params: params)
        Collection.from_response(response, type: Store)
      end

      def retrieve(id:)
        response = Client.get_request("stores/#{id}")
        Store.new(response.body["data"]) if response.success?
      end

    end

  end
end

module LemonSqueezy
  class Product < Object

    class << self

      def list(**params)
        response = Client.get_request("products", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: Product)
      end

      def retrieve(id:)
        response = Client.get_request("products/#{id}")
        Product.new(response.body["data"]) if response.success?
      end

    end

  end
end

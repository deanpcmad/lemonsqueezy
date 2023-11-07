module LemonSqueezy
  class Customer < Object

    class << self

      def list(**params)
        response = Client.get_request("customers", params: params)
        Collection.from_response(response, type: Customer)
      end

      def retrieve(id:)
        response = Client.get_request("customers/#{id}")
        Customer.new(response.body["data"]) if response.success?
      end

    end

  end
end

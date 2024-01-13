module LemonSqueezy
  class Discount < Object

    class << self

      def list(**params)
        response = Client.get_request("discounts", params: {filter: params})
        Collection.from_response(response, type: Discount)
      end

      def retrieve(id:)
        response = Client.get_request("discounts/#{id}")
        Discount.new(response.body["data"]) if response.success?
      end

    end

  end
end

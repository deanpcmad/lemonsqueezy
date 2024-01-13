module LemonSqueezy
  class Order < Object

    class << self

      def list(**params)
        response = Client.get_request("orders", params: {filter: params})
        Collection.from_response(response, type: Order)
      end

      def retrieve(id:)
        response = Client.get_request("orders/#{id}")
        Order.new(response.body["data"]) if response.success?
      end

      def order_items(id:)
        response = Client.get_request("order-items", params: {order_id: id})
        Collection.from_response(response, type: OrderItem)
      end

    end

  end
end

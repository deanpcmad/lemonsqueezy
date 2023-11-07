module LemonSqueezy
  class OrdersResource < Resource

    def list(**params)
      response = get_request("orders", params: params)
      Collection.from_response(response, type: Order)
    end

    def get(id:)
      response = get_request("orders/#{id}")
      Order.new(response.body["data"]) if response.success?
    end

    def order_items(id:)
      response = get_request("order-items", params: {order_id: id})
      Collection.from_response(response, type: OrderItem)
    end

  end
end

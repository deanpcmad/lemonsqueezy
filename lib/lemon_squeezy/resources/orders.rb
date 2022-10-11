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

  end
end

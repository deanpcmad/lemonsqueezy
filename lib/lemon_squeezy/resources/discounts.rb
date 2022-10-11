module LemonSqueezy
  class DiscountsResource < Resource

    def list(**params)
      response = get_request("discounts", params: params)
      Collection.from_response(response, type: Discount)
    end

    def get(id:)
      response = get_request("discounts/#{id}")
      Discount.new(response.body["data"]) if response.success?
    end

  end
end

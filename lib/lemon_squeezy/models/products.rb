module LemonSqueezy
  class ProductsResource < Resource

    def list(**params)
      response = get_request("products", params: params)
      Collection.from_response(response, type: Product)
    end

    def get(id:)
      response = get_request("products/#{id}")
      Product.new(response.body["data"]) if response.success?
    end

  end
end

module LemonSqueezy
  class CustomersResource < Resource

    def list(**params)
      response = get_request("customers", params: params)
      Collection.from_response(response, type: Customer)
    end

    def get(id:)
      response = get_request("customers/#{id}")
      Customer.new(response.body["data"]) if response.success?
    end

  end
end

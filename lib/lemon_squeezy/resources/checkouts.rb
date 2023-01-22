module LemonSqueezy
  class CheckoutsResource < Resource

    def list(**params)
      response = get_request("checkouts", params: params)
      Collection.from_response(response, type: Customer)
    end

    def get(id:)
      response = get_request("checkouts/#{id}")
      Customer.new(response.body["data"]) if response.success?
    end

    def create(store_id:, variant_id:, **attrs)
      data = {}

      data["type"] = "checkouts"

      data["relationships"] = {
        store: {
          data: {
            type: "stores",
            id: store_id.to_s
          }
        },
        variant: {
          data: {
            type: "variants",
            id: variant_id.to_s
          }
        }
      }

      data["attributes"] = attrs

      response = post_request("checkouts", body: {data: data}.to_json)

      Checkout.new(response.body["data"]) if response.success?
    end

  end
end

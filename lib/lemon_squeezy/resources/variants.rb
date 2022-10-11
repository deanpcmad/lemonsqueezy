module LemonSqueezy
  class VariantsResource < Resource

    def list(**params)
      response = get_request("variants", params: params)
      Collection.from_response(response, type: Variant)
    end

    def get(id:)
      response = get_request("variants/#{id}")
      Variant.new(response.body["data"]) if response.success?
    end

  end
end

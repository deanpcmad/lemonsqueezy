module LemonSqueezy
  class VariantsResource < Resource

    def list
      response = get_request("variants")
      Collection.from_response(response, type: Variant)
    end

    def get(id:)
      response = get_request("variants/#{id}")
      Variant.new(response.body["data"]) if response.success?
    end

  end
end

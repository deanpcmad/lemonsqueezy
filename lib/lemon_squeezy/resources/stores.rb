module LemonSqueezy
  class StoresResource < Resource

    def list
      response = get_request("stores")
      # response.body["data"]
      Collection.from_response(response, type: Store)
    end

    def get(id:)
      response = get_request("stores/#{id}")
      Store.new(response.body["data"]) if response.success?
    end

  end
end

module LemonSqueezy
  class SubscriptionsResource < Resource

    def list(**params)
      response = get_request("subscriptions", params: params)
      Collection.from_response(response, type: Subscription)
    end

    def get(id:)
      response = get_request("subscriptions/#{id}")
      Subscription.new(response.body["data"]) if response.success?
    end

  end
end

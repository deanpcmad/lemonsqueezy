module LemonSqueezy
  class SubscriptionInvoicesResource < Resource

    def list(**params)
      response = get_request("subscription-invoices", params: params)
      Collection.from_response(response, type: SubscriptionInvoice)
    end

    def get(id:)
      response = get_request("subscription-invoices/#{id}")
      SubscriptionInvoice.new(response.body["data"]) if response.success?
    end

  end
end

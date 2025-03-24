module LemonSqueezy
  class SubscriptionInvoice < Object

    class << self

      def list(**params)
        response = Client.get_request("subscription-invoices", params: params)
        Collection.from_response(response, type: SubscriptionInvoice)
      end

      def retrieve(id:)
        response = Client.get_request("subscription-invoices/#{id}")
        SubscriptionInvoice.new(response.body["data"]) if response.success?
      end

    end

  end
end

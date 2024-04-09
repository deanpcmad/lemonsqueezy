module LemonSqueezy
  class SubscriptionItem < Object

    class << self

      def list(**params)
        response = Client.get_request("subscription-items", params: {filter: params})
        Collection.from_response(response, type: SubscriptionItem)
      end

      def retrieve(id:)
        response = Client.get_request("subscription-items/#{id}")
        SubscriptionItem.new(response.body["data"]) if response.success?
      end

      def current_usage(id:)
        response = Client.get_request("subscription-items/#{id}/current-usage")
        SubscriptionUsage.new(response.body["meta"]) if response.success?
      end

      def update(id:, quantity:, invoice_immediately: false, disable_prorations: false)
        body = {
          data: {
            type: "subscription-items",
            id: id.to_s,
            attributes: {
              quantity: quantity,
              invoice_immediately: invoice_immediately,
              disable_prorations: disable_prorations
            }
          }
        }
        response = Client.patch_request("subscription-items/#{id}", body: body.to_json)
        SubscriptionItem.new(response.body["data"]) if response.success?
      end

    end

  end
end

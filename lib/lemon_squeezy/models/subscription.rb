module LemonSqueezy
  class Subscription < Object

    class << self

      def list(**params)
        response = Client.get_request("subscriptions", params: params)
        Collection.from_response(response, type: Subscription)
      end

      def retrieve(id:)
        response = Client.get_request("subscriptions/#{id}")
        Subscription.new(response.body["data"]) if response.success?
      end

      def update(id:, **attributes)
        body = {
          data: {
            type: "subscriptions",
            id: id.to_s,
            attributes: attributes
          }
        }

        response = Client.patch_request("subscriptions/#{id}", body: body.to_json)
        Subscription.new(response.body["data"]) if response.success?
      end

      # Kind: void or free
      def pause(id:, kind:, resumes_at: nil)
        body = {
          data: {
            type: "subscriptions",
            id: id.to_s,
            attributes: {
              pause: {mode: kind, resumes_at: resumes_at}
            }
          }
        }

        response = Client.patch_request("subscriptions/#{id}", body: body.to_json)
        Subscription.new(response.body["data"]) if response.success?
      end

      def unpause(id:)
        body = {
          data: {
            type: "subscriptions",
            id: id.to_s,
            attributes: {
              pause: nil
            }
          }
        }

        response = Client.patch_request("subscriptions/#{id}", body: body.to_json)
        Subscription.new(response.body["data"]) if response.success?
      end

      def cancel(id:)
        response = Client.delete_request("subscriptions/#{id}")
        Subscription.new(response.body["data"]) if response.success?
      end

      def uncancel(id:)
        body = {
          data: {
            type: "subscriptions",
            id: id.to_s,
            attributes: {
              cancelled: false
            }
          }
        }

        response = Client.patch_request("subscriptions/#{id}", body: body.to_json)
        Subscription.new(response.body["data"]) if response.success?
      end

      def change_plan(id:, plan_id:, variant_id:, invoice_immediately: false, disable_prorations: false)
        body = {
          data: {
            type: "subscriptions",
            id: id.to_s,
            attributes: {
              product_id: plan_id,
              variant_id: variant_id,
              invoice_immediately: invoice_immediately,
              disable_prorations: disable_prorations
            }
          }
        }

        response = Client.patch_request("subscriptions/#{id}", body: body.to_json)
        Subscription.new(response.body["data"]) if response.success?
      end

    end

  end
end

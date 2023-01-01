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

      response = patch_request("subscriptions/#{id}", body: body.to_json)
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

      response = patch_request("subscriptions/#{id}", body: body.to_json)
      Subscription.new(response.body["data"]) if response.success?
    end

    def cancel(id:)
      body = {
        data: {
          type: "subscriptions",
          id: id.to_s,
          attributes: {
            cancelled: true
          }
        }
      }

      response = patch_request("subscriptions/#{id}", body: body.to_json)
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

      response = patch_request("subscriptions/#{id}", body: body.to_json)
      Subscription.new(response.body["data"]) if response.success?
    end

    def change_plan(id:, plan_id:, variant_id:)
      body = {
        data: {
          type: "subscriptions",
          id: id.to_s,
          attributes: {
            product_id: plan_id,
            variant_id: variant_id
          }
        }
      }

      response = patch_request("subscriptions/#{id}", body: body.to_json)
      Subscription.new(response.body["data"]) if response.success?
    end

  end
end

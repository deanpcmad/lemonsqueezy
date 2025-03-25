module LemonSqueezy
  class Webhook < Object

    class << self

      def list(**params)
        response = Client.get_request("webhooks", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: Webhook)
      end

      def retrieve(id:)
        response = Client.get_request("webhooks/#{id}")
        Webhook.new(response.body["data"]) if response.success?
      end

      def create(store_id:, url:, events:, secret:, **params)
        body = {
          data: {
            type: "webhooks",
            attributes: {
              url: url,
              events: events,
              secret: secret
            }.merge(params),
            relationships: {
              store: {
                data: {
                  type: "stores",
                  id: store_id.to_s
                }
              },
            }
          }
        }
        response = Client.post_request("webhooks", body: body.to_json)
        Webhook.new(response.body["data"]) if response.success?
      end

      def update(id:, **params)
        body = {
          data: {
            type: "webhooks",
            id: id.to_s,
            attributes: params
          }
        }
        response = Client.patch_request("webhooks/#{id}", body: body.to_json)
        Webhook.new(response.body["data"]) if response.success?
      end

      def delete(id:)
        Client.delete_request("webhooks/#{id}")
      end

    end

  end
end

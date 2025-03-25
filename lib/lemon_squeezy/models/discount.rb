module LemonSqueezy
  class Discount < Object

    class << self

      def list(**params)
        response = Client.get_request("discounts", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: Discount)
      end

      def retrieve(id:)
        response = Client.get_request("discounts/#{id}")
        Discount.new(response.body["data"]) if response.success?
      end

      def create(store_id:, name:, code:, amount:, amount_type:, **params)
        body = {
          data: {
            type: "discounts",
            attributes: {
              name: name,
              code: code,
              amount: amount,
              amount_type: amount_type
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
        response = Client.post_request("discounts", body: body.to_json)
        Discount.new(response.body["data"]) if response.success?
      end

      def delete(id:)
        Client.delete_request("discounts/#{id}")
      end

    end

  end
end

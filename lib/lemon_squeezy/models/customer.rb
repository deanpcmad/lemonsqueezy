module LemonSqueezy
  class Customer < Object

    class << self

      def list(**params)
        response = Client.get_request("customers", params: params)
        Collection.from_response(response, type: Customer)
      end

      def retrieve(id:)
        response = Client.get_request("customers/#{id}")
        Customer.new(response.body["data"]) if response.success?
      end

      def create(store_id:, name:, email:, **params)
        body = {
          data: {
            type: "customers",
            attributes: {
              name: name,
              email: email
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
        response = Client.post_request("customers", body: body.to_json)
        Customer.new(response.body["data"]) if response.success?
      end

      def update(id:, **params)
        body = {
          data: {
            type: "customers",
            id: id.to_s,
            attributes: params
          }
        }
        puts body.to_json
        response = Client.patch_request("customers/#{id}", body: body.to_json)
        Customer.new(response.body["data"]) if response.success?
      end
    end

  end
end

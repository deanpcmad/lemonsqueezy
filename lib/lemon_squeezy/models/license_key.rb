module LemonSqueezy
  class LicenseKey < Object

    class << self

      def list(**params)
        response = Client.get_request("license-keys", params: {filter: params})
        Collection.from_response(response, type: LicenseKey)
      end

      def retrieve(id:)
        response = Client.get_request("license-keys/#{id}")
        LicenseKey.new(response.body["data"]) if response.success?
      end

      def update(id:, **attributes)
        body = {
          data: {
            type: "license-keys",
            id: id.to_s,
            attributes: attributes
          }
        }

        response = Client.patch_request("license-keys/#{id}", body: body.to_json)
        LicenseKey.new(response.body["data"]) if response.success?
      end

    end

  end
end

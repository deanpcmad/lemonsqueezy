module LemonSqueezy
  class LicenseKey < Object

    class << self

      def list(**params)
        response = Client.get_request("license-keys", params: params)
        Collection.from_response(response, type: LicenseKey)
      end

      def retrieve(id:)
        response = Client.get_request("license-keys/#{id}")
        LicenseKey.new(response.body["data"]) if response.success?
      end

    end

  end
end

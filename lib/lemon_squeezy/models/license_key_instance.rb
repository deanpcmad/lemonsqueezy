module LemonSqueezy
  class LicenseKeyInstance < Object

    class << self

      def list(**params)
        response = Client.get_request("license-key-instances", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: LicenseKeyInstance)
      end

      def retrieve(id:)
        response = Client.get_request("license-key-instances/#{id}")
        LicenseKeyInstance.new(response.body["data"]) if response.success?
      end

    end

  end
end

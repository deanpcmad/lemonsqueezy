module LemonSqueezy
  class LicenseKeyInstancesResource < Resource

    def list(**params)
      response = get_request("license-key-instances", params: params)
      Collection.from_response(response, type: LicenseKeyInstance)
    end

    def get(id:)
      response = get_request("license-key-instances/#{id}")
      LicenseKeyInstance.new(response.body["data"]) if response.success?
    end

  end
end

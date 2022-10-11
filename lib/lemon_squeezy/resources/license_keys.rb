module LemonSqueezy
  class LicenseKeysResource < Resource

    def list(**params)
      response = get_request("license-keys", params: params)
      Collection.from_response(response, type: LicenseKey)
    end

    def get(id:)
      response = get_request("license-keys/#{id}")
      LicenseKey.new(response.body["data"]) if response.success?
    end

  end
end

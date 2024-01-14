module LemonSqueezy
  class License < Object

    class << self

      def validate(key:, instance: nil)
        response = Client.post_request("licenses/validate", body: { license_key: key, instance_id: instance })
        License.new(response.body) if response.success?
      end

      def activate(key:, instance:)
        response = Client.post_request("licenses/activate", body: { license_key: key, instance_name: instance })
        License.new(response.body) if response.success?
      end

      def deactivate(key:, instance:)
        response = Client.post_request("licenses/deactivate", body: { license_key: key, instance_id: instance })
        License.new(response.body) if response.success?
      end

    end

  end
end

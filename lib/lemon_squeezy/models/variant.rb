module LemonSqueezy
  class Variant < Object

    class << self

      def list(**params)
        response = Client.get_request("variants", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: Variant)
      end

      def retrieve(id:)
        response = Client.get_request("variants/#{id}")
        Variant.new(response.body["data"]) if response.success?
      end

    end

  end
end

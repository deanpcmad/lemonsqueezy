module LemonSqueezy
  class File < Object

    class << self

      def list(**params)
        response = Client.get_request("files", params: Client.build_list_request_params(params))
        Collection.from_response(response, type: File)
      end

      def retrieve(id:)
        response = Client.get_request("files/#{id}")
        File.new(response.body["data"]) if response.success?
      end

    end

  end
end

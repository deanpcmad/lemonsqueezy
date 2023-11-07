module LemonSqueezy
  class FilesResource < Resource

    def list(**params)
      response = get_request("files", params: params)
      Collection.from_response(response, type: File)
    end

    def get(id:)
      response = get_request("files/#{id}")
      File.new(response.body["data"]) if response.success?
    end

  end
end

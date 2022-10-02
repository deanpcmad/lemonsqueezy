module LemonSqueezy
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:, key: nil)
      body = response.body

      if key.is_a?(String)
        data  = body["data"][key].map { |attrs| type.new(attrs) }
        total = body["data"]["total"]
      else
        data  = body["data"].map { |attrs| type.new(attrs) }
        total = body["data"].count
      end

      new(
        data: data,
        total: total
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end

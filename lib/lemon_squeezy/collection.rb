module LemonSqueezy
  class Collection
    attr_reader :data, :meta, :total

    def self.from_response(response, type:, key: nil)
      body = response.body

      if key.is_a?(String)
        data  = body["data"][key].map { |attrs| type.new(attrs) }
        total = body["data"]["total"]
      else
        data  = body["data"].map { |attrs| type.new(attrs) }
        total = body["data"].count
      end

      # Extract pagination metadata if available
      meta = body["meta"]
      pagination = meta&.dig("page")
      
      new(
        data: data,
        meta: {
          page: {
            total: pagination&.dig("total"),
            current_page: pagination&.dig("currentPage"),
            from: pagination&.dig("from"),
            to: pagination&.dig("to"),
            last_page: pagination&.dig("lastPage"),
            per_page: pagination&.dig("perPage")
          }
        },
        total: total
      )
    end

    def initialize(data:, meta:, total:)
      @data = data
      @meta = meta
      @total = total
    end
  end
end

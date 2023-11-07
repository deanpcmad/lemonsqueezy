require "ostruct"

module LemonSqueezy
  class Object < OpenStruct
    def initialize(attributes)
      # Remove relationships and links from responses as they are not required
      attributes.delete "relationships"
      attributes.delete "links"

      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end
  end
end

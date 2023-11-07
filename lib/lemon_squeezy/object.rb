require "ostruct"

module LemonSqueezy
  class Object < OpenStruct
    def initialize(attributes)
      # Remove relationships and links from responses as they are not required
      attributes.delete "relationships"
      attributes.delete "links"

      attrs = {}

      if attributes["attributes"]
        # Add ID from response to attributes
        attrs[:id] = attributes["id"] if attributes["id"]
        attrs.merge!(attributes["attributes"])
      else
        attrs.merge!(attributes)
      end

      super to_ostruct(attrs)
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

require "ostruct"

module LemonSqueezy
  class Object < OpenStruct
    def initialize(attributes)
      ostruct = to_ostruct(attributes)

      if ostruct.is_a?(Array)
        ostruct.map { |obj| super(obj) }
      else
        super(ostruct)
      end
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

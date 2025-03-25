# frozen_string_literal: true

module LemonSqueezy
  class Configuration

    attr_accessor :api_key, :default_page_size

    def initialize
      @default_page_size = 10
    end

  end
end

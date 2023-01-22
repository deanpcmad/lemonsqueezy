module LemonSqueezy
  class LicenseKeyInstance < Object

    def initialize(options = {})
      options.delete "relationships"
      options.delete "links"

      super options
    end

  end
end

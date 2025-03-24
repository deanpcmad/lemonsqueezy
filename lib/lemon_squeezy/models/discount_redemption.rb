module LemonSqueezy
  class DiscountRedemption < Object

    class << self

      def list(**params)
        response = Client.get_request("discount-redemptions", params: params)
        Collection.from_response(response, type: DiscountRedemption)
      end

      def retrieve(id:)
        response = Client.get_request("discount-redemptions/#{id}")
        DiscountRedemption.new(response.body["data"]) if response.success?
      end

    end

  end
end

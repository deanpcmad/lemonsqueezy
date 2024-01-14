module LemonSqueezy
  class User < Object

    class << self

      def me
        response = Client.get_request("users/me")
        User.new(response.body["data"]) if response.success?
      end

    end

  end
end

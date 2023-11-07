module LemonSqueezy
  class Client

    class << self

      def connection
        @connection ||= Faraday.new("https://api.lemonsqueezy.com/v1") do |conn|
          conn.request :authorization, :Bearer, LemonSqueezy.config.api_key

          conn.headers = {
            "User-Agent" => "lemonsqueezy/v#{VERSION} (github.com/deanpcmad/lemonsqueezy)",
            "Accept" => "application/vnd.api+json",
            "Content-Type" => "application/vnd.api+json"
          }

          conn.request :json

          conn.response :json
        end
      end

      def get_request(url, params: {}, headers: {})
        handle_response connection.get(url, params, headers)
      end

      def post_request(url, body: {}, headers: {})
        handle_response connection.post(url, body, headers)
      end

      def patch_request(url, body:, headers: {})
        handle_response connection.patch(url, body, headers)
      end

      def delete_request(url, headers: {})
        handle_response connection.delete(url, headers)
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Error 400: Your request was malformed. '#{response.body["error"]}'"
        when 401
          raise Error, "Error 401: You did not supply valid authentication credentials. '#{response.body["error"]}'"
        when 403
          raise Error, "Error 403: You are not allowed to perform that action. '#{response.body["error"]}'"
        when 404
          raise Error, "Error 404: No results were found for your request. '#{response.body["error"]}'"
        when 409
          raise Error, "Error 409: Your request was a conflict. '#{response.body["error"]}'"
        when 429
          raise Error, "Error 429: Your request exceeded the API rate limit. '#{response.body["error"]}'"
        when 500
          raise Error, "Error 500: We were unable to perform the request due to server-side problems. '#{response.body["error"]}'"
        when 503
          raise Error, "Error 503: You have been rate limited for sending more than 20 requests per second. '#{response.body["error"]}'"
        when 501
          raise Error, "Error 501: This resource has not been implemented. '#{response.body["error"]}'"
        when 204
          return true
        end

        if response.body && response.body["error"]
          raise Error, "Error #{response.body["error"]["code"]} - #{response.body["errors"]["message"]}"
        end

        response
      end

    end

  end
end

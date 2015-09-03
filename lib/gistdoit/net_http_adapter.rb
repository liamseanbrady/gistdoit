require 'net/http'

module GistDoIt
  class NetHTTPAdapter
    def post_with_token(token, uri, data)
      request = Net::HTTP::Post.new(uri.to_s)
      add_headers_to_request!(request, {"content-type" => "application/json", "Authorization" => "token #{token}"})
      add_body_to_request!(request, data)
      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        @response = http.request(request).body
      end

      @response
    end

    private

    def add_headers_to_request!(request, headers)
      headers.each do |header_name, header_value|
        request[header_name] = header_value
      end
    end

    def add_body_to_request!(request, data)
      request.body = data
    end
  end
end

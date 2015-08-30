module Github
  class Network
    def connect_with_token(token, uri, data)
      req = Net::HTTP::Post.new(uri.to_s)
      req.body = data
      req["content-type"] = "application/json"
      req["Authorization"] = "token #{token}"
      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        @response = http.request(req).body
      end

      @response
    end
  end
end

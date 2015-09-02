require 'json'
require 'yaml'
require_relative '../net_http_adapter'
require_relative './user_config'

module Github
  class Client
    def initialize(config = UserConfig.new, network = GistDoIt::NetHTTPAdapter.new)
      @config = config
      @network = network
    end

    def create_gist(gist)
      @data = { "description" => "#{gist.summary}", "public" => false, "files" => { "#{gist.name}" => { "content" => "#{gist.content}" } } }.to_json
      uri = URI("https://api.github.com/gists")
      @response = @network.post_with_token(token, uri, @data)
    end

    def response
      @response
    end

    def token
      @config.token
    end
  end
end

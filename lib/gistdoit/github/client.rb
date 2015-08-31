require 'net/http'
require 'json'
require 'yaml'
require_relative './network'
require_relative './user_config'

module Github
  class Client
    def initialize(config = UserConfig.new, network = Network.new)
      @config = config
      @network = network
    end

    def create_gist(gist)
      @data = { "description" => "#{gist.summary}", "public" => false, "files" => { "#{gist.name}" => { "content" => "#{gist.content}" } } }.to_json
      uri = URI("https://api.github.com/gists")
      @response = @network.connect_with_token(token, uri, @data)
    end

    def response
      @response
    end

    def token
      @config.token
    end
  end
end

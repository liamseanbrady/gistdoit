require_relative './test_helper'
require 'gistdoit/github/client'

module Github
  class ClientTest < Minitest::Test
    def setup
      @gist_data = Struct.new(:gist_data) {
        def username
          'liamseanbrady'
        end

        def summary
          'This is a cool gist'
        end

        def name
          'file.rb'
        end

        def content
          'def new_test; end'
        end
      }.new
    end

    def teardown
      @gist_data = nil
    end

    def test_client_gets_response_from_service
      fixture_path = File.expand_path('../fixtures/create_gist_response', __FILE__)
      response = File.read(fixture_path)

      user_config = Struct.new(:user_config) {
        def token
          'ab12345'
        end
      }.new

      test_scope = self

      network_adapter = Struct.new(:network_adapter) {
        def post_with_token(token, uri, data)
          fixture_path = File.expand_path('../fixtures/create_gist_response', __FILE__)
          File.read(fixture_path)
        end
      }.new

      client = Client.new(user_config, network_adapter)
      client.create_gist(@gist_data)

      assert_equal(response, client.response)
    end

    def test_token
      user_config = Struct.new(:user_config) {
        def token
          'ab12345'
        end
      }.new
        
      client = Client.new(user_config)
      
      assert_equal('ab12345', client.token)
    end
  end
end

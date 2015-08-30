require 'minitest/autorun'
require_relative './test_helper'
require 'gistdoit/github/user_config'

module Github
  class ConfigTest < Minitest::Test
    def test_parses_yaml_from_file
      config_file_path = File.expand_path('../fixtures/config.yml', __FILE__)
      user_config = UserConfig.new(config_file_path)
      config_data = { 'username' => 'liamseanbrady', 'token' => 'ab12345' }

      assert_equal(config_data, user_config.all)
    end

    def test_returns_value_if_key_exists
      config_file_path = File.expand_path('../fixtures/config.yml', __FILE__)
      user_config = UserConfig.new(config_file_path)
      config_data = { 'username' => 'liamseanbrady', 'token' => 'ab12345' }

      assert_equal('ab12345', user_config['token'])
    end

    def test_returns_nil_if_no_method_exists_for_a_key
      config_file_path = File.expand_path('../fixtures/config.yml', __FILE__)
      user_config = UserConfig.new(config_file_path)
      config_data = { 'username' => 'liamseanbrady', 'token' => 'ab12345' }

      assert_equal(nil, user_config.method_that_does_not_exist)
    end

    def test_returns_correct_value_if_method_exists_for_a_key
      config_file_path = File.expand_path('../fixtures/config.yml', __FILE__)
      user_config = UserConfig.new(config_file_path)
      config_data = { 'username' => 'liamseanbrady', 'token' => 'ab12345' }

      assert_equal('liamseanbrady', user_config.username)
    end
  end
end

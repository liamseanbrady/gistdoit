require 'minitest/autorun'
require_relative './test_helper'
require 'gistdoit/gist'

class GistTests < Minitest::Test
  def test_gist_reads_username_from_config_file
    user_config = Struct.new(:user_config) {
      def username
        'liamseanbrady'
      end
    }.new

    gist = Gist.new(user_config) 

    assert_equal('liamseanbrady', gist.github_username)
  end

  def test_gist_has_a_summary
    user_config = Struct.new(:user_config) {
      def username
        'liamseanbrady'
      end
    }.new

    gist = Gist.new(user_config)
    gist.summary = 'A good summary'

    assert_equal('A good summary', gist.summary)
  end


  def test_gist_has_a_name
    user_config = Struct.new(:user_config) {
      def username
        'liamseanbrady'
      end
    }.new

    gist = Gist.new(user_config)
    gist.name = 'my_gist.rb'

    assert_equal('my_gist.rb', gist.name)
  end

  def test_gist_has_content
    user_config = Struct.new(:user_config) {
      def username
        'liamseanbrady'
      end
    }.new

    gist = Gist.new(user_config)
    gist.content = 'def new_method; end'

    assert_equal('def new_method; end', gist.content)
  end
end

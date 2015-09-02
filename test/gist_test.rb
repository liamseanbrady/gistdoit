require 'minitest/autorun'
require_relative './test_helper'
require 'gistdoit/gist'

class GistTests < Minitest::Test
  def test_gist_reads_username_from_config_file
    gist_file_stub = Struct.new(:name, :content) {
      def name
        'my_gist.rb'
      end

      def content
        'def new_method; end'
      end
    }.new

    user_config = Struct.new(:user_config) {
      def username
        'liamseanbrady'
      end
    }.new

    gist = Gist.new(gist_file_stub, user_config) 

    assert_equal('liamseanbrady', gist.github_username)
  end

  def test_gist_has_a_gist_file
    gist_file_stub = Struct.new(:name, :content) {
      def name
        'my_gist.rb'
      end

      def content
        'def new_method; end'
      end
    }.new
    gist = Gist.new(gist_file_stub)

    assert_respond_to(gist, :gist_file)
  end

  def test_gist_has_a_summary
    gist_file_stub = Struct.new(:name, :content) {
      def name
        'my_gist.rb'
      end

      def content
        'def new_method; end'
      end
    }.new
    gist = Gist.new(gist_file_stub)
    gist.summary = 'A good summary'

    assert_equal('A good summary', gist.summary)
  end


  def test_gist_has_a_name
    gist_file_stub = Struct.new(:name, :content) {
      def name
        'my_gist.rb'
      end

      def content
        'def new_method; end'
      end
    }.new
    gist = Gist.new(gist_file_stub)

    assert_equal('my_gist.rb', gist.name)
  end

  def test_gist_has_content
    gist_file_stub = Struct.new(:name, :content) {
      def name
        'my_gist.rb'
      end

      def content
        'def new_method; end'
      end
    }.new
    gist = Gist.new(gist_file_stub)

    assert_equal('def new_method; end', gist.content)
  end
end

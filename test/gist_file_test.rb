require 'minitest/autorun'
require_relative './test_helper'
require 'gistdoit/gist_file'

class GistFileTest < Minitest::Test
  def test_gist_file_has_a_name
    content = 'This is some Ruby code'
    gist_file = GistFile.new('ruby_file.rb', content)

    assert_equal(gist_file.name, 'ruby_file.rb')
  end

  def test_gist_file_has_content
    content = 'This is some Ruby code'
    gist_file = GistFile.new('ruby_file.rb', content)

    assert_equal(gist_file.content, content)
  end
end

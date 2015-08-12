require 'minitest/autorun'


class Gistify
  def initialize(file_name)
    @file_name = file_name
  end

  def file_type
    extension = @file_name.split('.').last
    file_type =
      case extension
      when 'rb' then 'ruby'
      end
  end
end

class GistifyTests < Minitest::Test
  def test_identifying_extension_of_file
    file_name = 'test_file.rb'
    converter = Gistify.new(file_name)

    assert_equal(converter.file_type, 'ruby')
  end

  def test_gist_has_file_type
    converter = Gistify.new(Gist.new)
  end
end

class Gist
  require 'yaml'

  def initialize(config_file_path = 'config.yml')
    @config_file_path = config_file_path
  end

  def github_username
    config_data = parse_yaml_file(@config_file_path)
    config_data["github_username"]
  end

  def content=(file_contents)
    @content = file_contents
  end

  def content
    @content
  end

  private

  def parse_yaml_file(path)
    config_file = File.read(path)
    YAML.load(config_file)
  end
end

class GistTests < Minitest::Test
  def test_gist_reads_username_from_config_file
    config_file_path = 'config.yml'
    gist = Gist.new(config_file_path) 

    assert_equal(gist.github_username, 'liamseanbrady')
  end

  def test_gist_has_content
    content = File.read('content.rb')
    gist = Gist.new('config.yml')
    gist.content = content

    assert_equal(gist.content, content)
  end
end

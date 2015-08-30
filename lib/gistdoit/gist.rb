require 'yaml'
require 'gistdoit/github/user_config'

class Gist
  def initialize(gist_file, user_config = Github::UserConfig.new)
    @config = user_config
    @gist_file = gist_file
  end

  def github_username
    @config.username
  end

  def content=(file_contents)
    @content = file_contents
  end

  def content
    @content || @gist_file.content
  end

  def gist_file
    @gist_file
  end

  def summary
    @summary
  end

  def summary=(text)
    @summary = text
  end

  def name
    @name ||= @gist_file.name
  end

  def name=(text)
    @name = text
  end
end

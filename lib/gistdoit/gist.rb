require 'yaml'
require 'gistdoit/github/user_config'

class Gist
  def initialize(user_config = Github::UserConfig.new)
    @config = user_config
  end

  def github_username
    @config.username
  end

  def content=(file_contents)
    @content = file_contents
  end

  def content
    @content
  end

  def summary
    @summary
  end

  def summary=(text)
    @summary = text
  end

  def name
    @name
  end

  def name=(text)
    @name = text
  end
end

require 'yaml'
require 'gistdoit/github/user_config'

module GistDoIt
  class Gist
    def initialize(name: nil, content: nil, summary: nil, user_config: Github::UserConfig.new)
      @name = name
      @content = content
      @summary = summary
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
    
    def to_json
      { "description" => "#{summary}", "public" => false, "files" => { "#{name}" => { "content" => "#{content}" } } }.to_json
    end
  end
end

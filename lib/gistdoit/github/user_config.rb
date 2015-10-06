require 'yaml'

module Github
  class UserConfig
    # Do we actually need an instance here. Do we require state at any point?
    def initialize(file_path = File.expand_path('~') + '/.gistdoit')
      @file_path = file_path
    end

    def set_github_username(username)
      File.open(@file_path, 'a') do |file|
        file << YAML.dump({ 'github_username' => username })
      end
    end

    def has_github_username?
      YAML.load(File.readlines(@file_path).select { |line| !line.include?('---') }.join).key?('github_username')
    end

    def all
      file = File.read(@file_path)
      YAML.load(file)
    end

    def [](key)
      all[key]
    end

    def method_missing(symbol, *args)
      all[symbol.to_s]
    end
  end
end

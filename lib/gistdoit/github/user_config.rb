module Github
  class UserConfig
    def initialize(file_path = File.expand_path('~') + '/.gistdoit')
      @file_path = file_path
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

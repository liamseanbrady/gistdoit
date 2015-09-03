module GistDoIt
  class CLI
    def self.start(*args)
      cli = new
      cli.get_token
      description = cli.get_file_description
      relative_file_path = args.first
      file_contents = cli.get_file_contents(relative_file_path)
      base_file_name = File.basename(args.first)
      cli.create_gist(base_file_name, file_contents, description)
    end

    def create_gist(base_file_name, file_contents, description)
      gist_thing = Gist.new
      gist_thing.name = base_file_name
      gist_thing.content = file_contents
      gist_thing.summary = description
      client = Github::Client.new
      client.create_gist(gist_thing)
    end

    def get_file_contents(relative_file_path)
      path = Dir.pwd
      File.read("#{path}/#{relative_file_path}")
    end

    def base_file_name(path)
      File.basename(path)
    end
    
    def get_file_description
      in_blank_terminal do
        puts "Please describe your file..."
        description = $stdin.gets.chomp
      end
    end

    def in_blank_terminal
      system 'clear'
      yield
    end

    def get_token
      in_blank_terminal do
        config_path = File.expand_path('~') + '/.gistdoit'
        if !File.exist?(config_path)
          in_blank_terminal do
            puts "Please enter your token:"
            token = $stdin.gets.chomp
          end
          result = File.open(config_path, 'w') do |file|
            config_data = { 'token' => token }
            file << YAML.dump(config_data)
          end
        end
      end
    end
  end
end

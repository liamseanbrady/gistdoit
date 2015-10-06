require 'json'

module GistDoIt
  class CLI
    def self.start(*args)
      new.start(args.first)
    end

    def start(relative_file_path)
      base_file_name = File.basename(relative_file_path)
      file_contents = get_file_contents(relative_file_path)
      description = get_file_description
      create_gist(base_file_name, file_contents, description)
    end

    def create_gist(base_file_name, file_contents, description)
      gist = Gist.new(name: base_file_name, content: file_contents, summary: description)
      client = Github::Client.new
      response = client.create_gist(gist)
      parsed_response = JSON.parse(response)
      client.github_username = parsed_response['owner']['login'] unless client.has_github_username?
      show_url(parsed_response['html_url'])
    end

    def show_url(url)
      in_blank_terminal do
        puts "The link is: #{url}"
      end
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

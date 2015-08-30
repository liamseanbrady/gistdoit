Gem::Specification.new do |s|
  s.name = "gistdoit"
  s.version = "0.0.0"
  s.date = "2015-08-28"
  s.summary = "File to Gist converter"
  s.description = "An easy way to convert your files to Gists all within the terminal"
  s.authors = ["Liam Brady"]
  s.email = "liamseanbrady+gems@gmail.com"
  s.executables = %w[gistdoit]
  s.files = %w[bin/gistdoit user_config.rb gist.rb gist_file.rb github.rb client.rb network.rb]
  s.homepage = "http://github.com/liamseanbrady/gistdoit"
end

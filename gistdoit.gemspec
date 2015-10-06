Gem::Specification.new do |s|
  s.name = "gistdoit"
  s.version = "0.0.0"
  s.date = "2015-08-28"
  s.summary = "File to Gist converter"
  s.description = "An easy way to convert your files to Gists all within the terminal"
  s.authors = ["Liam Brady"]
  s.email = "liamseanbrady+gems@gmail.com"
  s.executables = %w[gistdoit]
  s.files = `git ls-files`.split("\n").reject { |file_name| file_name == 'sketch.md' }
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.require_paths = %w[lib]
  s.version = GistDoIt::VERSION
  s.homepage = "http://github.com/liamseanbrady/gistdoit"
end

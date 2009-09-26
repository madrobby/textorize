Gem::Specification.new do |s|
  s.name = "textorize"
  s.version = "0.0.1"
  s.date = "2009-05-15"
  s.summary = "OS X sub-pixel-antialiased PNG string renderer."
  s.email = "thomas@fesch.at"
  s.homepage = "http://github.com/madrobby/textorize"
  s.description = "Textorize is a OS X utility to render sub-pixel-antialised strings into PNG files."
  s.has_rdoc = false
  s.authors = ["Thomas Fuchs"]
  s.files = Dir["Rakefile", "bin/**/*", "lib/**/*", "test/**/*"]
  s.test_files = Dir["test/test_*.rb"] unless $SAFE > 0
  s.executables = ["textorize"]
end

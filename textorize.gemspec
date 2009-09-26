Gem::Specification.new do |s|
  s.name = "textorize"
  s.version = "0.0.3"
  s.date = "2009-09-26"
  s.summary = "OS X subpixel antialiased PNG string renderer"
  s.email = "thomas@fesch.at"
  s.homepage = "http://github.com/madrobby/textorize"
  s.description = "Textorize is a OS X utility to render subpixel antialised strings into PNG files."
  s.has_rdoc = false
  s.authors = ["Thomas Fuchs"]
  s.files = Dir["Rakefile", "bin/**/*", "lib/**/*", "test/**/*"]
  s.test_files = Dir["test/test_*.rb"] unless $SAFE > 0
  s.executables = ["textorize"]
end

Gem::Specification.new do |s|
  s.name = "textorize"
  s.version = "0.24"
  s.date = "2009-10-07"
  s.summary = "OS X subpixel antialiased PNG string renderer"
  s.email = "thomas@fesch.at"
  s.homepage = "http://textorize.org/"
  s.description = "Textorize is a OS X utility to render subpixel antialiased strings into PNG files."
  s.has_rdoc = false
  s.require_paths = ['lib']
  s.authors = ["Thomas Fuchs"]
  s.files = ["Rakefile", "LICENSE", "bin/textorize", "lib/textorize", "lib/textorize/renderer.rb", "lib/textorize/runner.rb", "lib/textorize/saver.rb", "lib/textorize/color.rb", "lib/textorize.rb", "test/test_runner.rb"]
  s.test_files = Dir["test/test_*.rb"] unless $SAFE > 0
  s.executables = ["textorize"]
end

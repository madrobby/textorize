require File.join(File.dirname(__FILE__), *%w".. lib textorize")
require "test/unit"

class RunnerTest < Test::Unit::TestCase
  
  def test_runner
    options = {}
    options[:font] ||= 'Arial'
    options[:size] ||= 28.0
    options[:kerning] ||= 0
    options[:lineheight] ||= options[:size]
    options[:width] ||= 250
    options[:obliqueness] ||= 0
    
    Textorize::Runner.new 'Hallo!', 'output.png', options
  end
  
end
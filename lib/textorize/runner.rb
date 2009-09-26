require 'osx/cocoa'

module Textorize
  class Runner
    
    def initialize(string, output, options)
      app = OSX::NSApplication.sharedApplication
      
      delegate = RunnerApplication.alloc.init
      delegate.options = options
      delegate.string = string
      delegate.output = output
      
      app.setDelegate delegate
      app.run
    end
    
  end

  class RunnerApplication < OSX::NSObject
    include OSX
    attr_accessor :options
    attr_accessor :string
    attr_accessor :output

    def initialize
      @window = NSWindow.alloc.initWithContentRect_styleMask_backing_defer([150, 1500, 1000, 500], NSBorderlessWindowMask, 2, 0)
    end
    
    def applicationDidFinishLaunching(notification)
      renderer = Renderer.new(@window, @string, @options)
      Saver.new(renderer).write_to_file(@output)
      NSApplication.sharedApplication.terminate(nil)
    end
    
  end

end

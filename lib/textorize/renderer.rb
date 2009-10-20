require 'osx/cocoa'

module Textorize
  class Renderer
    include OSX
    
    def initialize(window, string, options)
      @text_view = NSTextView.alloc.initWithFrame([0,0,0,0])
      
      window.opaque = false
      window.backgroundColor = NSColor.from_css('transparent')
      
      set_attr_and_text options, string
      window.contentView = @text_view
      @text_view.sizeToFit
      
      window.display
      window.orderFrontRegardless
    end
    
    def bitmap
      @text_view.lockFocus
      bitmap = NSBitmapImageRep.alloc.initWithFocusedViewRect(@text_view.bounds)
      @text_view.unlockFocus
      bitmap
    end
    
    private 
      
      def set_attr_and_text(options, string)
        @text_view.horizontallyResizable = true
        
        para = NSMutableParagraphStyle.alloc.init
        para.lineSpacing = options[:lineheight]
        
        options[:ligatures] ||= 'standard'
        
        @text_view.typingAttributes = {
          NSFontAttributeName => NSFont.fontWithName_size(options[:font], options[:size]),
          NSKernAttributeName => options[:kerning],
          NSParagraphStyleAttributeName => para,
          NSBaselineOffsetAttributeName => 0,
          NSObliquenessAttributeName => options[:obliqueness],
          NSLigatureAttributeName => { 'off' => 0, 'standard' => 1, 'all' => 2 }[options[:ligatures]]
        }
        
        @text_view.lowerBaseline(nil)
        
        @text_view.setTextContainerInset([options[:padding],options[:padding]]) if options[:padding]
        
        @text_view.string = string
        @text_view.textColor = NSColor.from_css(options[:color] || 'black')
        @text_view.backgroundColor = NSColor.from_css(options[:background] || 'white')
        @text_view.drawsBackground = true        
      end
    
  end
  
end

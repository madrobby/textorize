require 'osx/cocoa'

module Textorize
  class Renderer
    include OSX

    def initialize(window, string, options)
      @text_view = NSTextView.alloc.initWithFrame([0,0,0,0])

      set_attr_and_text options, string
      window.setContentView @text_view
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
        @text_view.setHorizontallyResizable(true)
        @text_view.useAllLigatures(nil)
        
        para = NSMutableParagraphStyle.alloc.init
        para.setLineSpacing(options[:lineheight])
        
        attribs = NSMutableDictionary.alloc.init
        attribs.setObject_forKey(NSFont.fontWithName_size(options[:font], options[:size]), NSFontAttributeName)
        attribs.setObject_forKey(options[:kerning], NSKernAttributeName)
        attribs.setObject_forKey(para, NSParagraphStyleAttributeName)
        attribs.setObject_forKey(0, NSBaselineOffsetAttributeName)
        attribs.setObject_forKey(options[:obliqueness], NSObliquenessAttributeName)
        
        @text_view.setTypingAttributes(attribs)
        @text_view.lowerBaseline(nil)
        
        @text_view.setString string
        
        color = (options[:color] || '0,0,0').split(',')
        background = (options[:background] || '1,1,1').split(',')
        
        @text_view.setTextColor(
          NSColor.colorWithDeviceRed_green_blue_alpha(color[0], color[1], color[2], 1))
        
        @text_view.setBackgroundColor( 
          NSColor.colorWithDeviceRed_green_blue_alpha(background[0], background[1], background[2], 1))
      end
    
  end

end

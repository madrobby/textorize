# this code taken from limechat
# http://github.com/psychs/limechat
# LimeChat is copyrighted free software by Satoshi Nakagawa <psychs@limechat.net>.

module OSX
  class NSColor
    def self.from_rgb(red, green, blue, alpha=1.0)
      NSColor.colorWithDeviceRed_green_blue_alpha(red/255.0, green/255.0, blue/255.0, alpha)
    end
    
    HTML4_KEYWORDS = {
      # taken from the CSS3 Color Module
      # http://www.w3.org/TR/css3-color/#html4
      # note that we don't support SVG color keywords
      'black' => from_rgb(0, 0, 0),
      'silver' => from_rgb(0xC0, 0xC0, 0xC0),
      'gray' => from_rgb(0x80, 0x80, 0x80),
      'white' => from_rgb(0xFF, 0xFF, 0xFF),
      'maroon' => from_rgb(0x80, 0, 0),
      'red' => from_rgb(0xFF, 0, 0),
      'purple' => from_rgb(0x80, 0, 0x80),
      'fuchsia' => from_rgb(0xFF, 0, 0xFF),
      'green' => from_rgb(0, 0x80, 0),
      'lime' => from_rgb(0, 0xFF, 0),
      'olive' => from_rgb(0x80, 0x80, 0),
      'yellow' => from_rgb(0xFF, 0xFF, 0),
      'navy' => from_rgb(0, 0, 0x80),
      'blue' => from_rgb(0, 0, 0xFF),
      'teal' => from_rgb(0, 0x80, 0x80),
      'aqua' => from_rgb(0, 0xFF, 0xFF),
      'transparent' => from_rgb(0, 0, 0, 0)
    }
 
    def self.from_css(str)
      case str
      when /^#([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i
        r = $1.to_i(16)
        g = $2.to_i(16)
        b = $3.to_i(16)
        from_rgb(r, g, b)
      when /^#([0-9a-f])([0-9a-f])([0-9a-f])$/i
        r = ($1*2).to_i(16)
        g = ($2*2).to_i(16)
        b = ($3*2).to_i(16)
        from_rgb(r, g, b)
      when /^rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)$/
        r = $1.to_i
        g = $2.to_i
        b = $3.to_i
        from_rgb(r, g, b)
      when /^rgba\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d*(?:\.\d+))\s*\)$/
        r = $1.to_i
        g = $2.to_i
        b = $3.to_i
        a = $4.to_f
        from_rgb(r, g, b, a)
      else
        HTML4_KEYWORDS[str]
      end
    rescue
      nil
    end
  end
end
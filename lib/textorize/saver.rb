module Textorize
  class Saver
    attr_reader :png
    
    def initialize(renderer)
      @bitmap = renderer.bitmap
      @png = @bitmap.representationUsingType NSPNGFileType, properties:nil
    end
    
    def write_to_file(file)
      @png.writeToFile file, atomically:true
      
      cg = @bitmap.CGImage
      w, h = CGImageGetWidth(cg), CGImageGetHeight(cg)
      puts "\n{\n  background: url(#{file});\n  width: #{w}px;\n  height: #{h}px;\n}\n"
    end
    
  end
end
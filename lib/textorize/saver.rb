module Textorize
  class Saver
    include OSX
    attr_reader :png
    
    def initialize(renderer)
      @bitmap = renderer.bitmap
      @png = @bitmap.representationUsingType_properties(NSPNGFileType, nil)
    end
    
    def write_to_file(file)
      @png.writeToFile_atomically(file, true)
      
      cg = @bitmap.CGImage
      w, h = CGImageGetWidth(cg), CGImageGetHeight(cg)
      puts "\n{\n  background: url(#{file});\n  width: #{w}px;\n  height: #{h}px;\n}\n"
    end
    
  end
end
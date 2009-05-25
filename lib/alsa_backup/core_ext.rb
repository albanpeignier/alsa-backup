class Time

  def floor(attribute, modulo)
    actual = self.send(attribute)
    self.change(attribute => actual - actual%modulo)
  end

end

class File

  def self.suffix_basename(file, suffix)
    dirname = File.dirname(file)
    
    dirname = 
      case dirname
      when "/": "/"
      when ".": ""
      else
        dirname + "/"
      end

    extension = File.extname(file)
    dirname +
      File.basename(file, extension) +
      suffix +
      extension
  end

  def self.write(file, content)
    File.open(file, "w") { |f| f.puts content }
  end

end

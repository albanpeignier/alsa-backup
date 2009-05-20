class Time

  def floor(attribute, modulo)
    actual = self.send(attribute)
    self.change(attribute => actual - actual%modulo)
  end

end

class File

  def self.extension(file)
    if file =~ /(\.[^.]*)$/
      $1
    else
      ""
    end
  end

  def self.suffix_basename(file, suffix)
    dirname = File.dirname(file)
    
    dirname = 
      case dirname
      when "/": "/"
      when ".": ""
      else
        dirname + "/"
      end

    extension = File.extension(file)
    dirname +
      File.basename(file, extension) +
      suffix +
      extension
  end

end

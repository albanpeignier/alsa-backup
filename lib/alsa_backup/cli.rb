require 'optparse'

require 'alsa_backup'

module AlsaBackup
  class CLI
    def self.execute(stdout, *arguments)
      options = {
      }
      mandatory_options = %w(file)

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          This application is wonderful because...

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        opts.on("-f", "--file=FILE", String,
                "This is a sample message.",
                "For multiple lines, add more strings.") { |arg| options[:file] = arg }
        opts.on("-l", "--length=LENGTH", String,
                "Length in seconds") { |arg| options[:length] = arg }
        opts.on("-c", "--config=CONFIG", String,
                "Configuration file") { |arg| options[:config] = arg }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

      AlsaBackup.recorder.file = options[:file]

      require File.expand_path(options[:config]) if options[:config]
      
      length = options[:length].to_i if options[:length]
      AlsaBackup.recorder.start(length)
    end
  end
end

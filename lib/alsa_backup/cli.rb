require 'optparse'

module AlsaBackup
  class CLI
    def self.execute(stdout, *arguments)
      options = {}
      mandatory_options = %w()

      OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          Alsa.Backup : continuous recording with alsa

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        opts.on("-f", "--file=FILE", String,
                "Recording file") { |arg| options[:file] = arg }
        opts.on("-l", "--length=LENGTH", String,
                "Length in seconds") { |arg| options[:length] = arg }
        opts.on("-d", "--directory=DIRECTORY", String,
                "Base directory") { |arg| options[:directory] = arg }
        opts.on("-c", "--config=CONFIG", String,
                "Configuration file") { |arg| options[:config] = arg }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

      load File.expand_path(options[:config]) if options[:config]

      AlsaBackup.recorder.file = options[:file] if options[:file]
      AlsaBackup.recorder.directory = options[:directory] if options[:directory]
      
      length = options[:length].to_i if options[:length]
      AlsaBackup.recorder.start(length)
    end
  end
end

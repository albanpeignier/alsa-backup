require 'optparse'
require 'daemons'

module AlsaBackup
  class CLI
    def self.execute(stdout, *arguments)
      options = {}
      mandatory_options = %w()

      OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          AlsaBackup : continuous recording with alsa

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
        opts.on("-p", "--pid=PID_FILE", String,
                "File to write the process pid") { |arg| options[:pid] = arg }
        opts.on("-b", "--background", nil,
                "Daemonize the process") { |arg| options[:daemonize] = true }
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

      pid_file = File.expand_path(options[:pid]) if options[:pid]

      Daemonize.daemonize(nil, "alsa-backup") if options[:daemonize]
      File.write(pid_file, $$) if pid_file
      
      length = options[:length].to_i if options[:length]
      AlsaBackup.recorder.start(length)
    rescue Exception => e
      AlsaBackup.logger.fatal(e)
    end
  end
end

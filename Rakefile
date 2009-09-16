require 'rubygems' unless ENV['NO_RUBYGEMS']
%w[rake rake/clean fileutils newgem hoe rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/alsa_backup'

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new('alsa-backup', AlsaBackup::VERSION) do |p|
  p.developer('Alban Peignier', 'alban.peignier@free.fr')
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.rubyforge_name       = p.name # TODO this is default value
  p.extra_deps         = [
    ['ffi','>= 0.3.5'], [ 'newgem', ">= #{::Newgem::VERSION}" ], [ 'daemons', '>= 1.0.10' ]
  ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]
  
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec

namespace :gems do
  task :install do
    gems = %w{activesupport ffi rspec daemons}
    sh "sudo gem install #{gems.join(' ')}"
  end
end

require 'debian/build'

include Debian::Build
require 'debian/build/config'

namespace "package" do
  Package.new(:"alsa-backup") do |t|
    t.version = '0.0.7'
    t.debian_increment = 2

    t.source_provider = GitExportProvider.new
  end
end

require 'debian/build/tasks'

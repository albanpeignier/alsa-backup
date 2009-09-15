begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  require 'spec'
end
begin
  require 'spec/rake/spectask'
rescue LoadError
  puts <<-EOS
To use rspec for testing you must install rspec gem:
    gem install rspec
EOS
  exit(0)
end

desc "Run the specs under spec/models"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

namespace :spec do
  desc "Generate spec HTML report"
  Spec::Rake::SpecTask.new('html') do |t|
    t.spec_opts = ["--format", "html:spec.html", "--diff"]
    t.fail_on_error = false
  end

  desc "Generate rcov report"
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.rcov = true
    t.rcov_opts = %w{--exclude / --include-file ^lib}
  end
end

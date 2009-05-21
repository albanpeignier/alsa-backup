# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{alsa-backup}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alban Peignier"]
  s.date = %q{2009-05-21}
  s.default_executable = %q{alsa.backup}
  s.description = %q{ALSA client to perform continuous recording}
  s.email = ["alban.peignier@free.fr"]
  s.executables = ["alsa.backup"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "TODO", "alsa-backup.gemspec", "bin/alsa.backup", "config", "config.sample", "lib/alsa.rb", "lib/alsa_backup.rb", "lib/alsa_backup/cli.rb", "lib/alsa_backup/core_ext.rb", "lib/alsa_backup/length_controller.rb", "lib/alsa_backup/recorder.rb", "lib/alsa_backup/writer.rb", "lib/sndfile.rb", "refs/alsa-record-example.rb", "refs/pcm_wrap.rb", "refs/sndfile-make-sine.rb", "refs/sndfile_wrap.rb", "script/console", "script/destroy", "script/generate", "spec/alsa/pcm_spec.rb", "spec/alsa_backup/cli_spec.rb", "spec/alsa_backup/core_ext_spec.rb", "spec/alsa_backup/recorder_spec.rb", "spec/alsa_backup/writer_spec.rb", "spec/alsa_backup_spec.rb", "spec/fixtures/config_test.rb", "spec/sndfile/info_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/alban.peignier/alsa-backup}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{alsa-backup}
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{ALSA client to perform continuous recording}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.3.5"])
      s.add_runtime_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<ffi>, [">= 0.3.5"])
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.3.5"])
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end

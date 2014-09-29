require 'bundler'
Bundler.setup

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "bmix/version"

desc "Builds the gem"
task :gem => :build
task :build do
  system "gem1.9 build bmix.gemspec"
  Dir.mkdir("pkg") unless Dir.exists?("pkg")
  system "mv bmix-#{Bmix::VERSION}.gem pkg/"
end

task :install => :build do
  system "sudo gem1.9 install pkg/bmix-#{ZWave::VERSION}.gem"
end

desc "Release the gem - Gemcutter"
task :release => :build do
  system "git tag -a v#{Bmix::VERSION} -m 'Tagging #{Bmix::VERSION}'"
  system "git push --tags"
  system "gem push pkg/bmix-#{Bmix::VERSION}.gem"
end

task :default => [:spec]

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bmix/version'

Gem::Specification.new do |s|
  s.name = "bmix"
  s.version = Bmix::VERSION

  s.description = "Interface library for Blinkenlights Stereoscope Mixer"
  s.homepage = "http://github.com/sarahemm/ruby-bmix"
  s.summary = "Bmix interface library"
  s.licenses = "MIT"
  s.authors = ["sarahemm"]
  s.email = "bmix@sen.cx"
  
  s.files = Dir.glob("{lib,spec}/**/*") + %w(README.md Rakefile)
  s.require_path = "lib"

  s.rubygems_version = "1.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.add_dependency("cairo", ["~> 1.12.0"])
end

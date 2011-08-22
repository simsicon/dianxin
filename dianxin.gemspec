# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dianxin/version"

Gem::Specification.new do |s|
  s.name        = "dianxin"
  s.version     = Dianxin::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Scott Ballantyne"]
  s.email       = ["ussballantyne@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{gem to send text messages with china telecom}
  s.description = %q{gem to integrate with sichuan china telecom}

  s.rubyforge_project = "dianxin"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

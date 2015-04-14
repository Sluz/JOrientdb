# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jorientdb/version'

Gem::Specification.new do |spec|
  spec.name          = "jorientdb"
  spec.version       = JOrientdb::VERSION
  spec.authors       = ["Cyril Bourgès"]
  spec.email         = ["cyril@tapastreet.com", "bourges.c@gmail.com"]

  spec.summary       = %q{ Wrapper Orientdb Driver }
  spec.description   = %q{ Wrapper of JDBC Driver of Orientdb database with "bind-it" for bindings }
  spec.homepage      = "https://github.com/Sluz/jorientdb"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://gitlab.scss.tcd.ie"
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency "bind-it", '~>0.2', '>= 0.2.7'
  
end

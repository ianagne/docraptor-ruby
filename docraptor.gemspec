# -*- encoding: utf-8 -*-

=begin
#DocRaptor

#A native client library for the DocRaptor HTML to PDF/XLS service.

OpenAPI spec version: 1.4.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.14

=end

$:.push File.expand_path("../lib", __FILE__)
require "docraptor/version"

Gem::Specification.new do |s|
  s.name        = "docraptor"
  s.version     = DocRaptor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Expected Behavior"]
  s.email       = ["support@docraptor.com"]
  s.homepage    = "https://github.com/docraptor/docraptor-ruby"
  s.summary     = "A wrapper for the DocRaptor HTML to PDF/XLS service."
  s.description = "A native client library for the DocRaptor HTML to PDF/XLS service."
  s.license     = 'MIT'
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'
  s.add_runtime_dependency 'addressable'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.1'
  s.add_development_dependency 'webmock', '~> 1.24', '>= 1.24.3'
  s.add_development_dependency 'autotest', '~> 4.4', '>= 4.4.6'
  s.add_development_dependency 'autotest-rails-pure', '~> 4.1', '>= 4.1.2'
  s.add_development_dependency 'autotest-growl', '~> 0.2', '>= 0.2.16'
  s.add_development_dependency 'autotest-fsevent', '~> 0.2', '>= 0.2.12'

  # added by script/fix_gemspec.rb.
  s.add_development_dependency 'rake', '~>11.2', '>= 11.2.2'
  s.add_development_dependency 'pry', '~>0.10', '>= 0.10.4'
  # </added> : if the above lines are missing in the gemspec, then
  # the matcher for autotest is probably broken

  s.files         = `git ls-files`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `git ls-files spec test`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end

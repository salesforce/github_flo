# coding: utf-8
# Copyright © 2017, Salesforce.com, Inc.
# All Rights Reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_flo/version'

Gem::Specification.new do |spec|
  spec.name          = "github_flo"
  spec.version       = GithubFlo::VERSION
  spec.authors       = ['Justin Powers', 'John Tuley']
  spec.email         = ['justin.powers@salesforce.com', 'jtuley@salesforce.com']

  spec.summary       = %q{"Github plugin for Flo"}
  spec.homepage      = "https://github.com/salesforce/github_flo"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"

  spec.add_dependency 'octokit', '~> 4.6.0'
  spec.add_dependency 'flo', '>= 0.0.3'
end

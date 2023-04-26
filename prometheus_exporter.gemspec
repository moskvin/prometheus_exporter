# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prometheus_exporter/version"

Gem::Specification.new do |spec|
  spec.name                 = "prometheus_exporter"
  spec.version              = PrometheusExporter::VERSION
  spec.authors              = ["Sam Saffron"]
  spec.email                = ["sam.saffron@gmail.com"]

  spec.summary              = %q{Prometheus Exporter}
  spec.description          = %q{Prometheus metric collector and exporter for Ruby}
  spec.homepage             = "https://github.com/discourse/prometheus_exporter"
  spec.license              = "MIT"

  spec.post_install_message = "prometheus_exporter will only bind to localhost by default as of v0.5"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|bin)/})
  end
  spec.bindir               = "bin"
  spec.executables          = ["prometheus_exporter"]
  spec.require_paths        = ["lib"]

  spec.add_dependency "webrick"

  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "bundler", ">= 2.1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "mini_racer"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "oj", "~> 3.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "minitest-stub-const"
  spec.add_development_dependency "rubocop-discourse"
  spec.add_development_dependency "appraisal", "~> 2.3"
  spec.add_development_dependency "activerecord", "~> 7.0.0"
  if !RUBY_ENGINE == 'jruby'
    spec.add_development_dependency "raindrops", "~> 0.19"
  end
  spec.required_ruby_version = '>= 2.5.0'
end

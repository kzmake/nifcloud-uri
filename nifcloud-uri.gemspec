# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nifcloud/uri/version"

Gem::Specification.new do |spec|
  spec.name = "nifcloud-uri"
  spec.version = Nifcloud::Uri::VERSION
  spec.authors = ["Kazuki Iwata"]
  spec.email = ["kazu.0516.k0n0f@gmail.com"]

  spec.summary = %q{Nifcloud uri generator.}
  spec.description = %q{面倒なURIを生成してくれるgem}
  spec.homepage = "https://github.com/kzmake/nifcloud-uri"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f)}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency 'activesupport'
end

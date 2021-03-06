# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ding_ding_robot/version"

Gem::Specification.new do |spec|
  spec.name          = "ding_ding_robot"
  spec.version       = DingDingRobot::VERSION
  spec.authors       = ["xxy"]
  spec.email         = ["xxy@xiangyang.com"]

  spec.summary       = %q{ding ding webhook robot ruby sdk}
  spec.description   = %q{ding ding webhook robot ruby sdk.}
  spec.homepage      = "https://github.com/xuxiangyang/ding_ding_robot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end

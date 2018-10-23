# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-storm'
  spec.version       = '0.0.4'
  spec.authors       = ['Hidenori Suzuki']
  spec.email         = ['hidenori.suzuki@yahoo.com']
  spec.summary       = 'a fluent plugin'
  spec.description   = 'storm stats input plugin'
  spec.homepage      = 'https://github.com/niyonmaruz/fluent-plugin-storm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fluentd', '~> 1.2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'rspec'
end


lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'convert_numeral/version'

Gem::Specification.new do |spec|
  spec.name          = 'convert_numeral'
  spec.version       = ConvertNumeral::VERSION
  spec.authors       = ['masatoshi_moritsuka']
  spec.email         = ['yakiyaki_ikayaki@yahoo.co.jp']

  spec.summary       = 'This gem convert numeral.'
  spec.description   = 'This gem convert numeral into Chinese Numeral or full-width numeral.'
  spec.homepage      = 'https://github.com/sanfrecce-osaka/convert_numeral'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

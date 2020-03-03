Gem::Specification.new do |spec|
  spec.name          = 'lita-onewheel-images'
  spec.version       = '0.6.1'
  spec.authors       = ['Andrew Kreps']
  spec.email         = ['andrew.kreps@gmail.com']
  spec.description   = 'An implementation of Google Custom Search Engine for image searches in chat.'
  spec.summary       = 'CSE Details to follow'
  spec.homepage      = 'https://github.com/onewheelskyward/lita-onewheel-images'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4'
  spec.add_runtime_dependency 'onewheel-google', '~> 1'

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rack-test', '~> 0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'simplecov', '~> 0'
  spec.add_development_dependency 'coveralls', '~> 0'
end

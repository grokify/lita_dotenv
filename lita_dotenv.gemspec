Gem::Specification.new do |spec|
  spec.name          = 'lita_dotenv'
  spec.date          = '2016-09-02'
  spec.version       = '0.0.1'
  spec.authors       = ['John Wang']
  spec.email         = ['johncwang@gmail.com']
  spec.description   = %q{A Lita .env config loader.}
  spec.summary       = %q{A Lita .env config loader that loads ENV values directly into Lita's configuration.}
  spec.homepage      = 'https://github.com/grokify/lita-dotenv_config'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/**/*']
  spec.files        += Dir['[A-Z]*'] + Dir['test/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'dotenv', '>= 2.1.1'
  spec.add_runtime_dependency 'lita', '>= 4.4.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov', '>= 0.9.2'
  spec.add_development_dependency 'coveralls'
end

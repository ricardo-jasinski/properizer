# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'properizer/version'

Gem::Specification.new do |spec|
  spec.name          = 'properizer'
  spec.version       = Properizer::VERSION
  spec.authors       = ['Jasinski']
  spec.email         = ['jasinski@solvis.com.br']

  spec.summary       = 'Properizer provides convenience methods to change the letter case in a sentence to Title Case.'
  spec.description   = 'Properizer provides convenience methods to change the letter case in a sentence to Title Case. It can be used to enforce some consistency in data that is input manually or read from sources outside your control.'
  spec.homepage      = 'https://github.com/ricardo-jasinski/properizer'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

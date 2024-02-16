# frozen_string_literal: true

require_relative 'lib/keycloak-connect-ruby/version'

Gem::Specification.new do |spec|
  spec.name                        = 'keycloak-connect-ruby'
  spec.version                     = KeycloakConnectRuby::VERSION
  spec.authors                     = ['Pedro Furtado']
  spec.email                       = ['pedro.felipe.azevedo.furtado@gmail.com']
  spec.summary                     = 'Ruby gem for integration with Keycloak API'
  spec.description                 = 'Ruby gem for integration with Keycloak API'
  spec.homepage                    = 'https://github.com/pedrofurtado/keycloak-connect-ruby'
  spec.license                     = 'MIT'
  spec.required_ruby_version       = Gem::Requirement.new('>= 2.0.0')
  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.files                       = Dir.chdir(File.expand_path('..', __FILE__)) { `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } }
  spec.bindir                      = 'exe'
  spec.executables                 = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths               = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'codecov'
end

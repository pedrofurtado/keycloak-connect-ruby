# frozen_string_literal: true

RSpec.describe KeycloakConnectRuby do
  it 'has a valid version number' do
    version = KeycloakConnectRuby::VERSION
    expect(version).not_to be nil
    expect(version).to match(/^[0-9]+\.[0-9]+\.[0-9]+$/)
  end
end

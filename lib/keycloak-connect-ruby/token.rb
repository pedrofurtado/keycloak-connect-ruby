require 'uri'
require 'net/http'
require 'json'

module KeycloakConnectRuby
  class Token
    def self.generate_from_client_credentials
      # colocar logger e proxy aqui
      uri = URI("#{KeycloakConnectRuby.config.url}/realms/#{KeycloakConnectRuby.config.realm}/protocol/openid-connect/token")

      params = {
        'client_id' => KeycloakConnectRuby.config.client_id,
        'client_secret' => KeycloakConnectRuby.config.client_secret,
        'grant_type' => 'client_credentials'
      }

      response = Net::HTTP.post_form(uri, params)
      tokens = JSON.parse(response.body)
      tokens['access_token']
    end
  end
end

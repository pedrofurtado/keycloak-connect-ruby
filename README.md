# Keycloak connect ruby

```ruby
require 'logger'

KeycloakConnectRuby.configure do |c|
  c.url = 'http://keycloak_server:8080'
  c.realm = 'my-company'
  c.client_id = 'my-sinatra-app'
  c.client_secret = 'dsfgfdgfdgfd'
  c.logger = Logger.new(STDOUT) # Or Rails.logger
  c.proxy = nil
end

class MyApiController < ApplicationController
  before_action :keycloak_authenticate_and_check_role!

  def current_user
    KeycloakConnectRuby::User.from_token(keycloak_token)
  end

  private

  def keycloak_token
    KeycloakConnectRuby::Token.validate_and_decode(bearer_token)
  end

  def bearer_token
    request.authorization&.to_s&.gsub(/^Bearer /, "")
  end

  def keycloak_authenticate_and_check_role!
    unless current_user.has_role?('my-role-name')
      render json: { error: 'your message here' }, status: :unauthorized
    end
  rescue KeycloakConnectRuby::Errors::Token::ExpiredError => e
    # ...
  rescue KeycloakConnectRuby::Errors::Token::NoProvidedError => e
    # ...
  rescue KeycloakConnectRuby::Errors::Token::InvalidFormatError => e
    # ...
  end

  def generate_keycloak_token_for_api_calls
    # Client Credentials Grant flow
    KeycloakConnectRuby::Token.generate_from_client_credentials

    # Resource Owner Password Credentials flow (or Direct Grant flow)
    KeycloakConnectRuby::Token.generate_from_password_credentials('username here', 'password here')
  end
end
```

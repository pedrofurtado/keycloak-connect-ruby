module KeycloakConnectRuby
  module Errors
    module Configuration
      class Error < StandardError; end
      class UnknownOptionError < Error; end
      class MissingOptionsError < Error; end
    end

    module Token
      class Error < StandardError; end
      class ExpiredError < Error; end
      class NoProvidedError < Error; end
      class InvalidFormatError < Error; end
    end
  end
end

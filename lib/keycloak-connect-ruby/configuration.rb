require 'ostruct'

module KeycloakConnectRuby
  CONFIG_OPTIONS = [
    'url',
    'realm',
    'client_id',
    'client_secret',
    'logger',
    'proxy'
  ]

  def self.configure
    options = OpenStruct.new
    yield options
    validate_options(options)
    @configuration ||= options
  end

  def self.config
    @configuration
  end

  def self.logger
    config.logger
  end

  def self.validate_options(options)
    keys = options.each_pair.to_a.map { |p| p[0].to_s }

    keys.each do |key|
      unless CONFIG_OPTIONS.include?(key)
        raise KeycloakConnectRuby::Errors::Configuration::UnknownOptionError, "Unknown option: #{key}. The config options are: #{CONFIG_OPTIONS.join(', ')}"
      end
    end

    missing_options = CONFIG_OPTIONS - keys

    if missing_options.any?
      raise KeycloakConnectRuby::Errors::Configuration::MissingOptionsError, "Missing options: #{missing_options.join(', ')}. The config options are: #{CONFIG_OPTIONS.join(', ')}"
    end
  end
end

require 'base64'
require 'json'
require 'openssl'
require 'share_meow_client/version'
require 'helpers/configuration'


module ShareMeowClient
  extend Configuration

  ##
  # Set the configuration variables
  #
  # == Usage
  #  # config/initializers/share_meow.rb
  #  ShareMeowClient.configuration do |config|
  #    config.base_url = 'https://your-share-meow.example.com'
  #    config.secret_key = 'a_very_long_secret_key'
  #  end
  define_setting :base_url
  define_setting :secret_key

  ##
  # Generates a ShareMeow URL
  #
  # == Usage
  #  image_url = ShareMeowClient.image_url(template: 'HelloWorld', options: { message: 'Hi' })
  #
  # @param [String] template
  #   The name of the ShareMeow template
  # @param [Hash] options
  #   The options required by the template
  #
  # @return [String] ShareMeow URL
  #
  # @api public

  def self.image_url(template:, options:)
    json_params = options.merge(template: template).to_json

    encoded_params = Base64.urlsafe_encode64(json_params)
    hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'.freeze), secret_key, encoded_params)
    hmac_digest = Base64.urlsafe_encode64([hmac].pack('H*'.freeze))

    "#{ base_url }/v1/#{ encoded_params }/#{ hmac_digest }/image.jpg"
  end
end

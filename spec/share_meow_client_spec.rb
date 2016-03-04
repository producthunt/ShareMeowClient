require 'spec_helper'

describe ShareMeowClient do
  it 'has a version number' do
    expect(ShareMeowClient::VERSION).not_to be nil
  end

  describe '.configuration' do
    it 'allows you to set config variables' do
      ShareMeowClient.configuration do |config|
        config.base_url = 'https://www.producthunt.com'
        config.secret_key = 'test'
      end

      expect(described_class.base_url).to eq 'https://www.producthunt.com'
      expect(described_class.secret_key).to eq 'test'
    end

    it 'throws an exception when setting a nil value' do
      expect do
        ShareMeowClient.configuration do |config|
          config.base_url = nil
          config.secret_key = nil
        end
      end.to raise_exception.with_message(/ShareMeowClient.base_url was not set. Please set it in your ShareMeowClient initializer/)
    end
  end

  describe '.image_url' do
    it 'generates a sharemeow url' do
      allow(ShareMeowClient).to receive(:secret_key).and_return 'fake'
      allow(ShareMeowClient).to receive(:base_url).and_return 'https://www.producthunt.com'

      image_url = described_class.image_url(template: 'HelloWorld', options: { message: 'hi' })

      expect(image_url).to eq 'https://www.producthunt.com/v1/eyJtZXNzYWdlIjoiaGkiLCJ0ZW1wbGF0ZSI6IkhlbGxvV29ybGQifQ==/' \
        'uqL4WmizPXMQhpmGH0bffRnSB1A=/image.jpg'
    end
  end
end

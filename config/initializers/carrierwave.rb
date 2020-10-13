unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIASCT6LHMGDY3UMMGI',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'tone-photo'
    config.cache_storage = :fog
  end
end

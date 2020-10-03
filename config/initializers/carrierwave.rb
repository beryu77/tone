unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAVG3P55VZ3HWH3DYH',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'tone-photo'
    config.cache_storage = :fog
  end
end

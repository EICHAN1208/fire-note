
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIA6NEPGRTN6RSRVLS7',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1',
  }
  config.fog_directory = 'fire-note-heroku'
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

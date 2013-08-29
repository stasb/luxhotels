CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAI5X23BNMCXTKLYQA',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-southeast-2'
  }
  config.fog_directory  = 'lxhotels'
  config.fog_public = true
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAI5X23BNMCXTKLYQA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'ap-southeast-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'lxhotels'                     # required
end

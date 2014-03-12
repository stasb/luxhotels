CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :region                 => 'ap-southeast-2'
  }
  config.fog_directory  = 'lxhotels'
  config.fog_public = true
end

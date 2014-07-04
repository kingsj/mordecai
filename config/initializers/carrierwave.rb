CarrierWave.configure do |config|
  # config.root = Rails.root.join('tmp')
  # config.cache_dir = 'uploads'
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],                        # required
    :region                 => 'sa-east-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV["AWS_S3_BUCKET"]                     # required
end
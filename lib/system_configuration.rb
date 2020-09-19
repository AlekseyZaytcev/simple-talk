class SystemConfiguration
  extend Dry::Configurable

  setting :webpack, reader: true do
    setting :server_url, ENV['WEBPACK_DEV_SERVER_URL']
    setting :manifest_path, ENV['WEBPACK_MANIFEST_PATH']
    setting :use_dev_server, ENV['USE_WEBPACK_DEV_SERVER'] == 'true'
    setting :use_gzip, ENV['USE_WEBPACK_GZIP'] == 'true'
  end
end

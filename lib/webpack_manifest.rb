# frozen_string_literal: true

require 'net/http'

class WebpackManifest
  def initialize(configuration)
    @configuration = configuration
  end

  def resolve_entry(file_name)
    entry = manifest[file_name]
    raise I18n.t('webpack.manifest_not_found', file_name: file_name) unless entry

    entry
  end

  private

  def manifest
    @manifest ||= read_manifest(configuration.use_dev_server ? data_from_server : data_from_file)
  end

  #:reek:UncommunicativeVariableName
  def read_manifest(data)
    JSON.parse data
  rescue StandardError => e
    raise I18n.t('webpack.read_manifest_error', manifest_path: manifest_path, message: e.message)
  end

  def data_from_server
    Net::HTTP.get URI(manifest_path)
  end

  def data_from_file
    File.open(manifest_path, 'r', &:read)
  end

  def manifest_path
    configuration.manifest_path
  end

  attr_reader :configuration
end

# frozen_string_literal: true

require 'net/http'

class WebpackManifest
  def initialize(configuration)
    @configuration = configuration
  end

  def resolve_entry(name)
    entry = manifest[name]
    raise "File #{name} is not found  in Webpack Manifest" unless entry

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
    raise "Error while reading manifest file #{manifest_path}. Does it exist? Exception details: #{e.message}"
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

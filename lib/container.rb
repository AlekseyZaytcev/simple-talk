# frozen_string_literal: true

require 'dry-container'
require 'dry-auto_inject'

class Container
  extend Dry::Container::Mixin

  register('system_configuration') { SystemConfiguration }
  register('webpack_manifest', memoize: true) { WebpackManifest.new(SystemConfiguration.webpack) }
end

Import = Dry::AutoInject(Container)

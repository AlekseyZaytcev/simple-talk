# frozen_string_literal: true

module Web
  module Helpers
    module Webpack
      CONFIGURATION = Container[:system_configuration].webpack
      WEBPACK_MANIFEST = Container[:webpack_manifest]

      def javascript_pack_tag(script)
        url = CONFIGURATION.use_dev_server ? WEBPACK_MANIFEST.resolve_entry(script) : build_gzip_asset_path(script)
        javascript url, async: true
      end

      def stylesheet_pack_tag(file)
        url = CONFIGURATION.use_dev_server ? '' : build_gzip_asset_path(file)
        stylesheet url
      end

      #:reek:UtilityFunction
      def assets_path(file)
        return [CONFIGURATION.server_url, 'assets', file].join('/') if CONFIGURATION.use_dev_server

        WEBPACK_MANIFEST.resolve_entry(file)
      end

      private

      def build_gzip_asset_path(file)
        full_path = WEBPACK_MANIFEST.resolve_entry(file)
        full_path = resolve_gzip_filename(full_path) if CONFIGURATION.use_gzip
        full_path.to_s
      end

      #:reek:UtilityFunction
      def resolve_gzip_filename(path)
        filename_with_hash = [path.split('/').last, '.gz'].join
        WEBPACK_MANIFEST.resolve_entry(filename_with_hash)
      end
    end
  end
end

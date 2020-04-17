require 'docker-api'
require_relative '../../spaces/space'
require_relative '../files/file'

module Docker
  module Images
    class Space < ::Spaces::Space

      delegate([:all, :get] => :bridge)

      def pull(identifier)
        bridge.create('fromImage' => identifier)
      end

      alias_method :import, :pull

      def from_directory(path, &block)
        bridge.build_from_dir(path, { 'dockerfile' => Files::File.identifier }, &block)
      end

      def from_tar(path)
        bridge.build_from_tar(File.open("#{path}.tar", 'r'))
      end

      def bridge
        Docker::Image
      end

    end
  end
end
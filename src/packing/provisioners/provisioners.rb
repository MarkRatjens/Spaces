require_relative '../../releases/divisible'

module Packing
  module Provisioners
    class Provisioners < ::Releases::Divisible

      class << self
        def inheritance_paths; __dir__ ;end
      end

      require_files_in :stanzas

      def memento
        stanzas.map(&:to_h).flatten.compact
      end

    end
  end
end

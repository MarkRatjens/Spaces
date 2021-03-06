module Publishing
  module Commands
    class Synchronizing < ::Spaces::Commands::Saving

      def space_identifier
        super || :publications
      end

      protected

      def commit
        space.synchronize_with(universe.blueprints, identifier)
      end

    end
  end
end

require_relative 'requires'

module Framework
  class Rails5
    class FromImage < Container::Docker::Step

      def content
        "FROM spaces/ngpassenger:current"
      end

    end
  end
end
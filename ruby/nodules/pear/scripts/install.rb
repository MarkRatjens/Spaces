require_relative '../../../texts/script'

module Nodules
  module Pear
    module Scripts
      class Install < Texts::Script

        def body
          "pear install #{context.name}"
        end

      end
    end
  end
end
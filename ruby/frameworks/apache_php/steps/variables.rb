require_relative '../../steps/variables'

module Frameworks
  module ApachePHP
    module Steps
      class Variables < Frameworks::Steps::Variables

        def content
        [
          super,
          %Q(
          ENV ContUser www-data
          )
        ]
        end

      end
    end
  end
end
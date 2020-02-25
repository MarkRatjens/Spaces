require_relative '../../../collaborators/script_once'

module Frameworks
  module ApachePHP
    module Scripts
      class Finalisation < Collaborators::ScriptOnce

        def body
          %Q(
          mkdir  -p /var/log/apache2/
          chown www-data /var/log/apache2/
          mkdir  -p /run/apache2/
          chown www-data /run/apache2/
          )
        end

      end
    end
  end
end
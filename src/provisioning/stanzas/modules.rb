require_relative '../../releases/stanza'

module Provisioning
  module Stanzas
    class Modules < ::Releases::Stanza

      def declaratives
        context.resolutions.map do |r|
          r.builders.all.map do |b|
            %Q(
              module "#{r.identifier}_#{b.type}" {
                source = "./modules/#{b.type}"
                name  = "#{r.identifier}"
              }
            )
          end
        end.flatten.join("\n")
      end

    end
  end
end

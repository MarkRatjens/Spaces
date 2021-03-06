module Providers
  class Docker < ::ProviderAspects::Provider
    class SystemPackages < ::ProviderAspects::SystemPackages

      def packing_artifact_for(key)
        "RUN #{temporary_script_path}/#{qualifier}/#{key} #{division.send(key)&.join(' ')}"
      end

    end
  end
end

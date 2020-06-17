require_relative '../../docker/files/step'

module Frameworks
  module Steps
    class ChownAppDir < Docker::Files::Step
      def instructions
        "RUN /#{context.release_path}/chown_app_dir.sh"
      end

    end
  end
end
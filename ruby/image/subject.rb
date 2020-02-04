require_relative '../spaces/product'
require_relative 'subject/collaboration'

module Image
  class Subject < ::Spaces::Product
    include Collaboration

    Dir["#{__dir__}/subject/scripts/*"].each { |f| require f }

    class << self
      def script_collaborators
        @@subject_script_collaborators ||= [:nodules, :software]
      end
    end

    def script_collaborators
      self.class.script_collaborators
    end

    def scripts
      script_collaborators.map { |c| tensor.send(c).scripts }.flatten.compact
    end

  end
end
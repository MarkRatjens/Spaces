module Blueprinting
  module Status

    def status
      OpenStruct.new(
        plan: {
          exist: plans.exist?(identifier)
        },
        publication: {
          exist: publications.exist?(identifier)
        }
      )
    end

  end
end

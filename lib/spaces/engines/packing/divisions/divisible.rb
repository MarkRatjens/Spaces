require_relative 'division'

module Packing
  module Divisible
    include Division

    def embedded_with(other); divisible_embedded_with(other) ;end

  end
end

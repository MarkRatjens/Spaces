require_relative '../framework/product'
require_relative 'tensor'
require_relative 'executable'

module Container
  class Container < ::Framework::Product
    # A mechanism by which software can be made executable.

    relation_accessor :executable

  end
end

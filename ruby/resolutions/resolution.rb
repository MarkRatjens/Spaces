require_relative '../spaces/model'
require_relative 'schema'
require_relative 'release'

module Resolutions
  class Resolution < Release

    delegate(
      resolution: :itself,
      [:identifier, :home_app_path] => :descriptor
    )

    alias_accessor :blueprint, :predecessor

    def initialize(struct: nil, blueprint: nil, descriptor: nil)
      self.blueprint = blueprint
      self.struct = duplicate(struct || blueprint&.struct)
      self.struct.descriptor = self.struct.descriptor&.merge(descriptor&.memento) || descriptor&.memento
    end

  end
end
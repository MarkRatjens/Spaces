require_relative 'division'

module Releases
  class Divisible < Division

    def related_divisions
      @related_divisions ||= collaboration.divisions
    end

    def all
      @all ||= struct&.map { |s| subdivision_for(s) }&.compact
    end

    def subdivision_for(struct)
      subdivision_class.new(struct: struct, division: self)
    rescue NameError => e
      struct
    rescue ArgumentError => e
      warn(error: e, klass: self.class, blueprint: context_identifier, content: struct.deep_to_h)
      nil
    end

    def subdivision_class; Module.const_get(klass.name.singularize) ;end

    def memento; all&.map(&:memento) || super ;end

    def initialize(struct: nil, collaboration: nil, label: nil)
      check_subdivision_class
      super
    end

    def check_subdivision_class
      subdivision_class
    rescue NameError => e
      warn(error: e, klass: klass.name.singularize)
    end

    def default
      @default ||= OpenStruct.new
    end

  end
end

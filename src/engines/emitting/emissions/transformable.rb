module Emissions
  class Transformable < ::Spaces::Model

    delegate(
      identifier: :struct,
      mandatory_keys: :composition
    )

    def complete?; true ;end

    def descriptor_class; ::Spaces::Descriptor ;end

    def arena_stanzas; stanzas_for(:arena) ;end
    def packing_stanzas; stanzas_for(:packing) ;end
    def provisioning_stanzas; stanzas_for(:provisioning) ;end

    def stanzas_for(symbol); _stanzas_for(symbol) ;end

    protected

    def all_complete?(array)
      array.map(&:complete?).all_true?
    end

    private

    def _stanzas_for(symbol)
      raise TransformableWithoutStanzaError
    rescue TransformableWithoutStanzaError => e
      warn(error: e, method: "#{symbol}_stanzas", klass: klass, verbosity: [:silencex])
      []
    end

  end
end


class TransformableWithoutStanzaError < StandardError
end
require_relative 'embeddable'
require_relative 'resolvable'
require_relative 'provider_independent'

module Divisions
  class Division < ::Transforming::Transformable
    include Engines::Logger
    include Embeddable
    include Resolvable
    include ProviderIndependent

    attr_accessor :label

    class << self
      def prototype(emission:, label:)
        new(emission: emission, label: label)
      end

      def default_struct; OpenStruct.new ;end
    end

    relation_accessor :emission

    delegate(
      default_struct: :klass,
      [:composition, :auxiliary_folders, :blueprint_identifier, :configuration, :runtime_identifier, :packing_identifier, :arena] => :emission,
      ranking: :composition,
      resolutions: :universe
    )

    def packing_division?
      klass.ancestors.include?(::Packing::Division)
    end

    def composition_rank; ranking.index(klass) ;end

    def context_identifier; emission.context_identifier ;end

    def localized; self ;end
    def globalized; self ;end

    def content
      auxiliary_folders.map do |d|
        auxiliary_paths_for(d).map do |p|
          Interpolating::FileText.new(origin: p, directory: d, transformable: self)
        end
      end.flatten
    end

    def auxiliary_paths_for(symbol)
      auxiliary_path.join("#{symbol}").glob("**/*").reject(&:directory?)
    end

    def auxiliary_path
      Pathname(__dir__.gsub('transform', 'blueprint')).join(qualifier)
    end

    def empty; self.class.new(emission: emission, struct: default_struct, label: label) ;end

    def any?; !empty? ;end
    def empty?; struct == OpenStruct.new ;end

    def inflated
      duplicate(self).tap { |s| s.struct = s.struct.merge(inflatables) }
    end

    def deflated
      empty.tap { |s| s.struct = OpenStruct.new(deflatables) }
    end

    def merge(other); struct.merge(other.struct) ;end

    def initialize(emission:, struct: nil, label: nil)
      self.emission = emission
      self.label = label
      self.struct = struct || emission.struct[label] || default_struct
    end

    def to_s; struct ;end

  end
end

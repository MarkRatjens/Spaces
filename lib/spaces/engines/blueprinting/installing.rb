module Blueprinting
  module Installing

    def installation_in(arena)
      empty_installation.tap do |m|
        m.arena = arena
        m.struct.identifier = struct.identifier
        m.struct.input = struct.input
        m.cache_primary_identifiers
      end.with_embeds.infixes_resolved
    end

    def empty_installation; installation_class.new ;end
    def installation_class; ::Installing::Installation ;end

  end
end

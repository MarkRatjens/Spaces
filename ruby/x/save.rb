require_relative '../universal/space'

def universe
  @u ||= Universal::Space.new
end

def import
  universe.blueprints.import(descriptor)
end

def blueprint
  @blueprint ||=
  begin
    universe.blueprints.by(descriptor)
  rescue Errno::ENOENT
    import
  end
end

def installation
  @installation ||=
  begin
    universe.installations.by(descriptor)
  rescue Errno::ENOENT
    blueprint.installation
  end
end

def clear
  @u = nil
  @blueprint = nil
  @installation = nil
end

def save_image_subject
  universe.images.save(installation.image_subject)
end

def save_installation
  universe.installations.save_yaml(blueprint.installation)
end

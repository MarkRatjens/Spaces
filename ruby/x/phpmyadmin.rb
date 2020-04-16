require_relative '../spaces/descriptor'
require_relative 'save'

def descriptor
  @descriptor ||= Spaces::Descriptor.new(
    repository: 'http://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-all-languages.tar.gz',
    extraction: 'tar -xzpf'
  )
end

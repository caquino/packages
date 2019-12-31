class SetupNetworkEnvironment < FPM::Cookery::Recipe
  name        'setup-network-environment'
  description 'Create an environment file with system networking information.'
  homepage    'https://github.com/kelseyhightower/setup-network-environment'
  section     'admin'

  require 'open-uri'
  require 'json'

  version     JSON.parse(URI.parse("https://api.github.com/repos/kelseyhightower/setup-network-environment/releases/latest").read)['tag_name']
  revision    0

  source "https://github.com/kelseyhightower/setup-network-environment/releases/download/#{version}/setup-network-environment"

  post_install 'files/post_install'

  def build
  end

  def install
    lib('systemd/system').install workdir('files/usr/lib/systemd/system/setup-network-environment.service')
    chmod 0555, 'setup-network-environment'
    bin.install 'setup-network-environment'
  end

end

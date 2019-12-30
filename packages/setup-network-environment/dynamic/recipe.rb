class SetupNetworkEnvironment < FPM::Cookery::Recipe
  name        'setup-network-environment'
  description 'Create an environment file with system networking information.'
  homepage    'https://github.com/kelseyhightower/setup-network-environment'
  section     'admin'

  require 'open-uri'
  require 'json'

  version     JSON.parse(URI.parse("https://api.github.com/repos/kelseyhightower/setup-network-environment/releases/latest").read)['tag_name']
  revision    0

  source      'https://github.com/kelseyhightower/setup-network-environment.git',
    :with => 'git',
    :tag => "#{version}"

  platforms [:debian, :ubuntu] do
    build_depends 'git', 'golang-go'
  end

  platforms :centos do
    build_depends 'epel-release', 'git', 'golang'
  end

  post_install 'files/post_install'

  def build
    safesystem "go get -d ./..."
    safesystem "go build ./..."
  end

  def install
    lib('systemd/system').install workdir('files/usr/lib/systemd/system/setup-network-environment.service')
    bin.install "setup-network-environment"
  end

end

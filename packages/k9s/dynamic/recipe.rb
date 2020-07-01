class K9s < FPM::Cookery::Recipe
  name        'k9s'
  description 'Kubernetes CLI To Manage Your Clusters In Style!'
  homepage    'https://github.com/derailed/k9s'
  section     'admin'

  require 'open-uri'
  require 'json'

  version     JSON.parse(URI.parse("https://api.github.com/repos/derailed/k9s/releases").read).first['tag_name']
  revision    0

  source "https://github.com/derailed/k9s/releases/download/#{version}/k9s_Linux_x86_64.tar.gz"

  def build
  end

  def install
    bin.install 'k9s'
  end

end

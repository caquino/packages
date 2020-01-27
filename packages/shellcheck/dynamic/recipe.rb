class Shellcheck < FPM::Cookery::Recipe
  name        'shellcheck'
  description 'ShellCheck, a static analysis tool for shell scripts https://www.shellcheck.net'
  homepage    'https://github.com/koalaman/shellcheck'
  section     'admin'

  require     'open-uri'
  version     JSON.parse(URI.parse("https://api.github.com/repos/koalaman/shellcheck/tags").read).first['name']
  revision    0

  source      "https://storage.googleapis.com/shellcheck/shellcheck-#{version}.linux.x86_64.tar.xz"

  def build
  end

  def install
    bin.install 'shellcheck'
  end
end


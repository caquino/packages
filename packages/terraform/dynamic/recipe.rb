class Terraform < FPM::Cookery::Recipe
  name        'terraform'
  description 'Terraform is a tool for building, changing, and combining infrastructure safely and efficiently.'
  homepage    'https://github.com/hashicorp/terraform'
  section     'admin'

  require     'open-uri'
  base_url    = "https://releases.hashicorp.com/#{name}"
  version     URI.parse("#{base_url}").read.split("\n").select { |n| n.include? "href" }[1].split('"')[1].split("/").last
  revision    0

  base_url    = "https://releases.hashicorp.com/#{name}/#{version}"
  source      "#{base_url}/#{name}_#{version}_linux_amd64.zip"
  sha256      URI.parse("#{base_url}/#{name}_#{version}_SHA256SUMS").read().split("\n").select { |n| n.include? "linux_amd64.zip" }[0].split.first

  build_depends 'zip'

  def build
  end

  def install
    glob = File.join(builddir, File.basename(self.source, ".zip"), '*')

    Dir[glob].each do |file|
      bin.install(file)
    end
  end
end

